#!/bin/bash

inventory='{
  "all": {
    "children": {
      "app": {
        "hosts": {
          "appserver": null
        }
      },
      "db": {
        "hosts": {
          "51.250.73.164": null
        }
      }
    }
  }
}'

echo $inventory > ./inventory.json