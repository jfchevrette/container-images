Set($rtname, $ENV{RTNAME} || "rt.example.com" );
Set($Organization, $ENV{ORGANIZATION} || "rt.example.com" );
Set($OwnerEmail , $ENV{OWNER_EMAIL} || 'support@example.com');
Set($LogToSTDERR, $ENV{LOG_LEVEL} || "info" );
Set($Timezone, "UTC" );

Set($DatabaseType, "mysql" );
Set($DatabaseHost, $ENV{DATABASE_HOST} || "db" );
Set($DatabasePort, $ENV{DATABASE_PORT} || "" );
Set($DatabaseName, $ENV{DATABASE_NAME} || "rt4" );
Set($DatabaseUser, $ENV{DATABASE_USER} || "rt_user" );
Set($DatabasePassword, $ENV{DATABASE_PASSWORD} || "rt_pass" );
Set($DatabaseRTHost , $ENV{DATABASE_RT_HOST} || '%');

Set( %FullTextSearch,
    Enable     => 1,
    Indexed    => 1,
    Column     => 'ContentIndex',
    Table      => 'Attachments',
);

1;
