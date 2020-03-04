
require 'net/http'
require 'uri'
require 'json'

# image files 
# https://public-us.opendatasoft.com/explore/dataset/world-heritage-list/information/?utm_content=buffer491f6&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer&disjunctive.states&sort=date_inscribed&dataChart=eyJxdWVyaWVzIjpbeyJjaGFydHMiOlt7InR5cGUiOiJjb2x1bW4iLCJmdW5jIjoiQ09VTlQiLCJ5QXhpcyI6ImFyZWFfaGVjdGFyZXMiLCJzY2llbnRpZmljRGlzcGxheSI6dHJ1ZSwiY29sb3IiOiJyYW5nZS1BY2NlbnQifV0sInhBeGlzIjoiZGF0ZV9pbnNjcmliZWQiLCJtYXhwb2ludHMiOjUwLCJzb3J0IjoiIiwidGltZXNjYWxlIjoieWVhciIsInNlcmllc0JyZWFrZG93biI6ImNhdGVnb3J5Iiwic3RhY2tlZCI6Im5vcm1hbCIsImNvbmZpZyI6eyJkYXRhc2V0Ijoid29ybGQtaGVyaXRhZ2UtbGlzdCIsIm9wdGlvbnMiOnsidXRtX2NvbnRlbnQiOiJidWZmZXI0OTFmNiIsInV0bV9tZWRpdW0iOiJzb2NpYWwiLCJ1dG1fc291cmNlIjoidHdpdHRlci5jb20iLCJ1dG1fY2FtcGFpZ24iOiJidWZmZXIiLCJkaXNqdW5jdGl2ZS5zdGF0ZXMiOnRydWUsInNvcnQiOiJkYXRlX2luc2NyaWJlZCIsInJlZmluZS5jYXRlZ29yeSI6IkN1bHR1cmFsIiwicmVmaW5lLnJlZ2lvbiI6IkxhdGluIEFtZXJpY2EgYW5kIHRoZSBDYXJpYmJlYW4ifX19XSwidGltZXNjYWxlIjoiIiwiZGlzcGxheUxlZ2VuZCI6dHJ1ZSwiYWxpZ25Nb250aCI6dHJ1ZX0%3D&location=3,-10.78135,-73.88056&basemap=jawg.streets

# original source: https://data.opendatasoft.com/explore/dataset/world-heritage-list%40public-us/api/?disjunctive.states
# latin america
uri = URI.parse('https://data.opendatasoft.com/api/records/1.0/search/?dataset=world-heritage-list%40public-us&rows=30&facet=category&facet=region&facet=states&refine.region=Latin+America+and+the+Caribbean')
json = Net::HTTP.get(uri) #NET::HTTPを利用してAPIを呼ぶ
result = JSON.parse(json) #返ってきたjsonデータをrubyの配列に変換するためのライン
sites = result['records']

# asia 
uri_asia = URI.parse('https://data.opendatasoft.com/api/records/1.0/search/?dataset=world-heritage-list%40public-us&rows=30&facet=category&facet=region&facet=states&refine.region=Asia+and+the+Pacific')
json_asia = Net::HTTP.get(uri_asia) #NET::HTTPを利用してAPIを呼ぶ
result_asia = JSON.parse(json_asia) #返ってきたjsonデータをrubyの配列に変換するためのライン
sites_asia = result_asia['records']

# Latinamerica.delete_all
sites.each_with_index do |site, i| Latinamerica.create(
        category: site['fields']['category'],
        id_number: site['fields']['id_number'],
        region: site['fields']['region'],
        site: site['fields']['site'],
        states: site['fields']['states'],
        image_pic: site['fields']['image_url']['filename'],
        location: site['fields']['location'],
        short_description: site['fields']['short_description'],
        http_url: site['fields']['http_url'],
        index: i
    )
end

# sites_asia.each_with_index do |site, i| Latinamerica.create(
#     category: site['fields']['category'],
#     id_number: site['fields']['id_number'],
#     region: site['fields']['region'],
#     site: site['fields']['site'],
#     states: site['fields']['states'],
#     image_pic: site['fields']['image_url']['filename'],
#     location: site['fields']['location'],
#     short_description: site['fields']['short_description'],
#     http_url: site['fields']['http_url'],
#     index: i
# )
# end
