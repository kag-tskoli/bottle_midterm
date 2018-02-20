<!doctype html>
<html lang="is">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="/static/styles.css">
</head>
<body>

    <p><a href="/">Til baka</a></p>

    % for station in data['results']:
    %   if station['key'] == key:
            <h3>{{station['key']}}</h3>
            <h1>{{station['company']}}</h1>
            <h2>{{station['name']}}</h2>
            <h3>{{station['bensin95']}}</h3>
    %   end
    % end

</body>
</html>