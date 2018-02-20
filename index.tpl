<!doctype html>
<html lang="is">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Yfirlit eldsneytis</title>
    <link rel="stylesheet" href="/static/styles.css">
</head>
<body>

    <%
    companies = []
    for station in data['results']:
        if station['company'] not in companies:
            companies.append(station['company'])
        end
    end
    %>

    <h1>Veldu fyrirtæki:</h1>
    % for company in companies:
        <h2><a href="/company/{{company}}">{{company}}</a></h2>
    % end

    <%
    bensin95disc = []
    for station in data['results']:
        if station['bensin95_discount'] != None:
            bensin95disc.append({'company': station['company'], 'bensin95_discount': station['bensin95_discount']})
        end
    end

    minb95 = min(data['results'], key=lambda x: x['bensin95'])
    minb95disc = min(bensin95disc, key=lambda x: x['bensin95_discount'])
    mind = min(data['results'], key=lambda x: x['diesel'])

    %>

    <h4>Lægsta verð - Bensín 95: {{minb95['bensin95']}}, {{minb95['company']}}</h4>
    <h4>Lægsta verð með afslætti - Bensín 95: {{minb95disc['bensin95_discount']}}, {{minb95disc['company']}}</h4>
    <h4>Lægsta verð - Diesel: {{mind['diesel']}} hjá {{mind['company']}}</h4>

    <%
    import datetime

    t = data['timestampPriceCheck']
    t = t[:19]

    t = datetime.datetime.strptime(t, '%Y-%m-%dT%H:%M:%S')

    %>

    <h5>Síðast uppfært: {{t.strftime('%d. %b. %Y Kl. %H:%M')}}</h5>

</body>
</html>