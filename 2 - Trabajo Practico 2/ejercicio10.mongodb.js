use(universidad);

// Seguridad y backups Muestra los pasos para crear un usuario con permisos de 
// lectura y escritura, y los comandos necesarios para hacer backup y restauración 
// de una base de datos.

db.createUser({
    user: "Usuario",
    pwd: "Contrasena",
    roles: [
        {
            role: "readWrite",
            db: "universidad"
        }
    ]
});

// En mi caso personal en la terminal de vscode escribi el siguiente comando:
// mongodump --db universidad --out C:\MongoBackup

//2025-04-17T13:06:44.332-0300    writing universidad.cursos to C:\MongoBackup\universidad\cursos.bson
//2025-04-17T13:06:44.335-0300    done dumping universidad.cursos (5 documents)

// significa que se creo el backup

// Para reinsertar los documentos 

// mongorestore --db universidad C:\MongoBackup\universidad
//2025-04-17T13:07:04.332-0300    restoring
//2025-04-17T13:07:04.335-0300    don