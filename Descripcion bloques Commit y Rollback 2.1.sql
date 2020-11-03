        /*TRANSACCION EN MODELO PATOLOGIA*/
        /*Guarda informacion de una patologia con los sintomas asociados*/
        Try
            Comando.CommandText = "SET AUTOCOMMIT = OFF;"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "START TRANSACTION;"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "LOCK TABLE patologia WRITE, asociados WRITE"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "INSERT INTO patologia (id, nombre, ponderacion, descripcion) 
                                    VALUES 
                                    (" & Me.Id & ", '" & Me.Nombre & "', " & Me.Ponderacion & ", '" & Me.Descripcion & "') 
                                    ON DUPLICATE KEY UPDATE nombre ='" & Me.Nombre & "', ponderacion =" & Me.Ponderacion & ", descripcion='" & Me.Descripcion & "', activo= " & Me.Activo
            Comando.ExecuteNonQuery()

            /*Borra de a tabla asociados la relacion que existe entre la patologia y los sintomas*/
            Comando.CommandText = "DELETE FROM asociados WHERE idPatologia =" & Me.Id
            Comando.ExecuteNonQuery()

            /*Re escribe en la tabla asociados las informacion actualizada*/
            For Each sintoma In ListaDeSintomasAsociados
                Comando.CommandText = "INSERT INTO asociados VALUES ( " & sqlTexto & " , " & sintoma.ID & ")"
                Comando.ExecuteNonQuery()
            Next

            Comando.CommandText = "UNLOCK TABLES"
            Comando.ExecuteNonQuery()
            
            Comando.CommandText = "COMMIT;"
            Comando.ExecuteNonQuery()

        Catch ex As Exception
            Comando.CommandText = "ROLLBACK;"
            Comando.ExecuteNonQuery()
        End Try

        /*TRANSACCION MODELO MEDICO*/
        /*Guarda informacion sobre el medico en persona, medico y telefonos. */
        Try
            Comando.CommandText = "SET AUTOCOMMIT = OFF;"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "START TRANSACTION;"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "LOCK TABLE persona WRITE, medico WRITE, telefono WRITE"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "INSERT INTO persona (docidentidad, mail, nombres, apellidos, calle, numero, barrio, esquina, apartamento, fechaNacimiento, activo) 
                                        VALUES(" & Me.Documento & ", '" & Me.Email & "', '" & Me.Nombres & "', '" & Me.Apellidos & "','" & Me.Calle & "', '" & Me.Numero & "', 
                                                '" & Me.Barrio & "', '" & Me.Esquina & "', '" & Me.Apartamento & "', '" & Me.FechaNacimiento & "', activo =1) 
                                        ON DUPLICATE KEY UPDATE 
                                                mail='" & Me.Email & "', nombres='" & Me.Nombres & "', apellidos='" & Me.Apellidos & "', calle ='" & Me.Calle & "', numero='" & Me.Numero & "',
                                                barrio='" & Me.Barrio & "', esquina='" & Me.Esquina & "', apartamento='" & Me.Apartamento & "', fechaNacimiento='" & Me.FechaNacimiento & "', activo =" & Me.Activo
            Comando.ExecuteNonQuery()

            Comando.CommandText = "INSERT INTO medico VALUES(" & Me.Documento & ", " & Me.NumeroMedico & ") 
                                ON DUPLICATE KEY UPDATE ndemedico=" & Me.NumeroMedico
            Comando.ExecuteNonQuery()

            Comando.CommandText = "DELETE FROM telefono WHERE docidentidad=" & Me.Documento
            Comando.ExecuteNonQuery()

            For Each Telefono In Me.Telefonos.Rows
                If Telefono("Telefono").ToString.Length > 1 Then
                    Comando.CommandText = "INSERT INTO telefono VALUES(" & Me.Documento & ", '" & Telefono("Telefono").ToString & "')"
                    Comando.ExecuteNonQuery()
                End If
            Next

            Comando.CommandText = "UNLOCK TABLES"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "COMMIT;"
            Comando.ExecuteNonQuery()

        Catch ex As Exception
            Comando.CommandText = "ROLLBACK;"
            Comando.ExecuteNonQuery()
        End Try

        /*MODELO ADMINSTRATIVO*/
        /*Guarda informacion sobre el gestor/administrativo en tabla persona, en administrativo y en telefono*/
        Try
            Comando.CommandText = "SET AUTOCOMMIT = OFF;"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "START TRANSACTION;"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "LOCK TABLE persona WRITE, administrativo WRITE, telefono WRITE"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "INSERT INTO persona (docidentidad, mail, nombres, apellidos, calle, numero, barrio, esquina, apartamento, fechaNacimiento, activo) 
                                        VALUES(" & Me.Documento & ", '" & Me.Email & "', '" & Me.Nombres & "', '" & Me.Apellidos & "','" & Me.Calle & "', '" & Me.Numero & "', 
                                                '" & Me.Barrio & "', '" & Me.Esquina & "', '" & Me.Apartamento & "', '" & Me.FechaNacimiento & "', activo =1) 
                                        ON DUPLICATE KEY UPDATE 
                                                mail='" & Me.Email & "', nombres='" & Me.Nombres & "', apellidos='" & Me.Apellidos & "', calle ='" & Me.Calle & "', numero='" & Me.Numero & "',
                                                barrio='" & Me.Barrio & "', esquina='" & Me.Esquina & "', apartamento='" & Me.Apartamento & "', fechaNacimiento='" & Me.FechaNacimiento & "', activo =" & Me.Activo
            Comando.ExecuteNonQuery()

            Comando.CommandText = "INSERT IGNORE INTO administrativo VALUES(" & Me.Documento & ", " & Me.NumeroEmpleado & ") ON DUPLICATE KEY UPDATE ndeempleado=" & Me.NumeroEmpleado
            Comando.ExecuteNonQuery()

            Comando.CommandText = "DELETE FROM telefono WHERE docidentidad=" & Me.Documento
            Comando.ExecuteNonQuery()

            For Each Telefono In Me.Telefonos.Rows
                If Telefono("Telefono").ToString.Length > 1 Then
                    Comando.CommandText = "INSERT INTO telefono VALUES(" & Me.Documento & ", '" & Telefono("Telefono").ToString & "')"
                    Comando.ExecuteNonQuery()
                End If
            Next

            Comando.CommandText = "UNLOCK TABLES"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "COMMIT;"
            Comando.ExecuteNonQuery()

        Catch ex As Exception
            Comando.CommandText = "ROLLBACK;"
            Comando.ExecuteNonQuery()
        End Try

        /*TRANSACCION PACIENTE*/
        /*Guarda informacion del paciente en tabla persona, en categoria paciente, en telefono y en pre-existente*/
        Try
            Comando.CommandText = "SET AUTOCOMMIT = OFF;"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "START TRANSACTION;"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "LOCK TABLE persona WRITE, paciente WRITE, telefono WRITE, preexistentes WRITE"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "INSERT INTO persona (docidentidad, mail, nombres, apellidos, calle, numero, barrio, esquina, apartamento, fechaNacimiento, activo) 
                                        VALUES(" & Me.Documento & ", '" & Me.Email & "', '" & Me.Nombres & "', '" & Me.Apellidos & "','" & Me.Calle & "', '" & Me.Numero & "', 
                                                '" & Me.Barrio & "', '" & Me.Esquina & "', '" & Me.Apartamento & "', '" & Me.FechaNacimiento & "', activo =1) 
                                        ON DUPLICATE KEY UPDATE 
                                                mail='" & Me.Email & "', nombres='" & Me.Nombres & "', apellidos='" & Me.Apellidos & "', calle ='" & Me.Calle & "', numero='" & Me.Numero & "',
                                                barrio='" & Me.Barrio & "', esquina='" & Me.Esquina & "', apartamento='" & Me.Apartamento & "', fechaNacimiento='" & Me.FechaNacimiento & "', activo =" & Me.Activo
            Comando.ExecuteNonQuery()

            /*Si existe ya el paciente ignora el error, sino lo ingresa*/
            Comando.CommandText = "INSERT IGNORE INTO paciente VALUES(" & Me.Documento & ")"
            Comando.ExecuteNonQuery()

            /*Borra la informacion existente en tabla telefono*/
            Comando.CommandText = "DELETE FROM telefono WHERE docidentidad=" & Me.Documento
            Comando.ExecuteNonQuery()

            /*Vuevle a escribir tabla telefono con los datos actualizados*/
            For Each Telefono In Me.Telefonos.Rows
                If Telefono("Telefono").ToString.Length > 1 Then
                    Comando.CommandText = "INSERT INTO telefono VALUES(" & Me.Documento & ", '" & Telefono("Telefono").ToString & "')"
                    Comando.ExecuteNonQuery()
                End If
            Next

            /*Borra la informacion existente en tabla preexistentes del paciente*/
            Comando.CommandText = "DELETE FROM preexistentes WHERE docidentidad=" & Me.Documento
            Comando.ExecuteNonQuery()

            /*Vuevle a escribir tabla preexistentes con los datos actualizados*/
            For Each PreExistentes In Me.TablaPreExistente.Rows
                If PreExistentes("preExistentes").ToString.Length > 1 Then
                    Comando.CommandText = "INSERT INTO preexistentes VALUES(" & Me.Documento & ", '" & PreExistentes("preExistentes").ToString & "')"
                    Comando.ExecuteNonQuery()
                End If
            Next

            Comando.CommandText = "UNLOCK TABLES"
            Comando.ExecuteNonQuery()
            
            Comando.CommandText = "COMMIT;"
            Comando.ExecuteNonQuery()

        Catch ex As Exception
            Comando.CommandText = "ROLLBACK;"
            Comando.ExecuteNonQuery()
        End Try
    End Sub      

        