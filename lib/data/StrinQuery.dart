class StringQuery {
  static final CreateTableUsuario= "CREATE TABLE IF NOT EXISTS USUARIO("+
        "ID     INTEGER       PRIMARY KEY ON CONFLICT ROLLBACK UNIQUE,"+
        "    NOME   VARCHAR (30)  NOT NULL,"+
        "    SENHA  VARCHAR (100) NOT NULL,"+
        "    DATCRI DATE  NOT NULL,"+
        "    IMAGE  BLOB  NOT NULL"+
        ");";

}

