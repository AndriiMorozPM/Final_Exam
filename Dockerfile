FROM httpd:2.4
ENTRYPOINT echo '<html><head>Exam</head><body><h1>Hello world!</h1></body></html>' > /usr/local/apache2/htdocs/index.html && httpd-foreground