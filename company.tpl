<!doctype html>
<html lang="is">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{c}}</title>
    <link rel="stylesheet" href="/static/styles.css">
</head>
<body>
    <p><a href="/">Til baka</a></p>
    <table border="1">
    % for station in data['results']:
    %   if station['company'] == c:
            <tr>
                <td><a href="/details/{{station['key']}}">{{station['key']}}</a></td>
                <td>{{station['company']}}</td>
                <td>{{station['name']}}</td>
            </tr>
        % end
    % end
    </table>
</body>
</html>