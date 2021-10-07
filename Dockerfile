FROM httpd:2.4
ENTRYPOINT echo '<html><head>Exam</head><body>Hello world!</body></html>' > /usr/local/apache2/htdocs/index.html && httpd-foreground