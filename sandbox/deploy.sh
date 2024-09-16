perl -i -pe 's/^\s+/  "/; s/:\s+/": /; s/:\s+/: "/; s/,/",/; s/com\n/com"\n/' service-account-key.json
