import requests

url = "http://212.111.41.68:3000/graphql"

query = """
{
    mapData(id: "data_series.in_ha") {
        map {
            id
            name
            color
            year
            value
            slug
        }
    }
}
"""

result = requests.post(url, json={'query': query})

print(result.json())
