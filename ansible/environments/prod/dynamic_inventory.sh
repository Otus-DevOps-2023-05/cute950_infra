#!/bin/bash

inventory='{
  "all": {
    "children": {
      "app": {
        "hosts": {
          "51.250.8.115": null
        }
      },
      "db": {
        "hosts": {
          "51.250.68.120": null
        }
      }
    }
  }
}'

echo $inventory > ./inventory.json
