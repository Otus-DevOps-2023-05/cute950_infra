#!/bin/bash

inventory='{
  "all": {
    "children": {
      "app": {
        "hosts": {
          "158.160.108.169": null
        }
      },
      "db": {
        "hosts": {
          "51.250.78.85": null
        }
      }
    }
  }
}'

echo $inventory > ./inventory.json
