using System.Text.Encodings.Web;
using System.Text.Unicode;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.EntityFrameworkCore;
using Shaa.Persistence;
using Shaa.Persistence.Data;

#region Services

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

#region Context

builder.Services.AddDbContext<ShaaDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("ShaaConnection"))
);

#endregion

#region Authentication

builder.Services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = CookieAuthenticationDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = CookieAuthenticationDefaults.AuthenticationScheme;
    options.DefaultScheme = CookieAuthenticationDefaults.AuthenticationScheme;
    options.DefaultSignInScheme = CookieAuthenticationDefaults.AuthenticationScheme;
}).AddCookie(options =>
{
    options.LoginPath = "/Login";
    options.LogoutPath = "/Logout";
    options.ExpireTimeSpan = TimeSpan.FromDays(30);
});

#endregion

#region Encode

builder.Services.AddSingleton<HtmlEncoder>(
    HtmlEncoder.Create(allowedRanges: new[] { UnicodeRanges.All }));

#endregion

#region Dependencies Registeration

DependencyContainer.RegisterDependency(builder.Services);

#endregion

#region Cors

// builder.Services.AddCors(options =>
// {
//     options.AddDefaultPolicy(
//         build =>
//         {
//             build.WithOrigins(PathTools.SiteAddress, "http://localhost:4200")
//                 .AllowAnyHeader()
//                 .AllowAnyMethod();
//         });
// });

#endregion

#endregion

#region Middlewares

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

// app.UseCors(build =>
// {
//     build
//         .AllowAnyOrigin()
//         .AllowAnyMethod()
//         .AllowAnyHeader();
// });

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();

#endregion