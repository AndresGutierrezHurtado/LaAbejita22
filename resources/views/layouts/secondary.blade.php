<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title> @yield('title') | {{ config('app.name', 'Uniformes la Abejita 22') }}</title> 
        
        <!-- Styles and Resources -->
        <link rel="shortcut icon" href="/images/logo.png" type="image/x-icon">
        @vite(['resources/css/app.css', 'resources/js/app.js'])

    </head>
    <body class="bg-slate-50 font-[system-ui] min-h-screen">

        <!-- Page Content -->
        @yield('content')

    </body>
</html>
