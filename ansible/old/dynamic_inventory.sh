#!/bin/bash

inventory='{
  "all": {
    "children": {
      "app": {
        "hosts": {
          "84.201.129.148": null
        }
      },
      "db": {
        "hosts": {
          "51.250.70.222": null
        }
      }
    }
  }
}'

echo $inventory > ./inventory.json
