/* SENTENCIAS DESDE MYSQL */
/*Sentencia para usuario paciente*/
            CREATE USER 'documento'@'%' IDENTIFIED BY 'Pa.documento'
            GRANT SELECT ON dbTriage.persona TO 'documento'@'%'
            GRANT SELECT ON dbTriage.telefono TO 'documento'@'%'
            GRANT SELECT ON dbTriage.medico TO 'documento'@'%'
            GRANT SELECT ON dbTriage.paciente TO 'documento'@'%'
            GRANT SELECT ON dbTriage.preexistentes TO 'documento'@'%'
            GRANT SELECT, INSERT, UPDATE ON dbTriage.sesion TO 'documento'@'%'
            GRANT SELECT ON dbTriage.sintoma TO 'documento'@'%'
            GRANT SELECT ON dbTriage.patologia TO 'documento'@'%'
            GRANT SELECT, INSERT, UPDATE ON dbTriage.chat TO 'documento'@'%'
            GRANT SELECT, INSERT ON dbTriage.diagnostico TO 'documento'@'%'
            GRANT SELECT, INSERT ON dbTriage.recibe TO 'documento'@'%'
            GRANT SELECT, INSERT ON dbTriage.tiene TO 'documento'@'%'
            GRANT SELECT ON dbTriage.asociados TO 'documento'@'%'
            GRANT SELECT ON dbTriage.setting TO 'documento'@'%'
            FLUSH PRIVILEGES

/*Sentencia para usuarios medicos*/
            CREATE USER 'documento'@'192.168.3.%' IDENTIFIED BY 'Me.documento'
            GRANT SELECT ON dbTriage.persona TO 'documento'@'192.168.3.%'
            GRANT SELECT ON dbTriage.telefono TO 'documento'@'192.168.3.%'
            GRANT SELECT ON dbTriage.medico TO 'documento'@'192.168.3.%'            
            GRANT SELECT ON dbTriage.paciente TO 'documento'@'192.168.3.%'
            GRANT SELECT ON dbTriage.preexistentes TO 'documento'@'192.168.3.%'
            GRANT SELECT, UPDATE ON dbTriage.sesion TO 'documento'@'192.168.3.%'            
            GRANT SELECT ON dbTriage.sintoma TO 'documento'@'192.168.3.%'
            GRANT SELECT, INSERT, UPDATE ON dbTriage.chat TO 'documento'@'192.168.3.%'
            GRANT SELECT ON dbTriage.recibe TO 'documento'@'192.168.3.%'
            GRANT SELECT ON dbTriage.tiene TO 'documento'@'192.168.3.%'
            GRANT SELECT ON dbTriage.setting TO 'documento'@'%'
            FLUSH PRIVILEGES

/*Sentencia para usuarios gestores/administrativos*/
            GRANT ALL PRIVILEGES ON *.* TO 'documento'@'192.168.3.6' IDENTIFIED BY 'Ge.documento' WITH GRANT OPTION
            GRANT SELECT, INSERT, UPDATE ON dbTriage.persona TO 'documento'@'192.168.3.6'
            GRANT SELECT, INSERT, UPDATE, DELETE ON dbTriage.telefono TO 'documento'@'192.168.3.6'
            GRANT SELECT, INSERT, UPDATE ON dbTriage.administrativo TO 'documento'@'192.168.3.6'
            GRANT SELECT, INSERT, UPDATE ON dbTriage.medico TO 'documento'@'192.168.3.6'
            GRANT SELECT, INSERT, UPDATE ON dbTriage.paciente TO 'documento'@'192.168.3.6'
            GRANT SELECT, INSERT, UPDATE, DELETE ON dbTriage.preexistentes TO 'documento'@'192.168.3.6'
            GRANT SELECT, INSERT, UPDATE ON dbTriage.sintoma TO 'documento'@'192.168.3.6'
            GRANT SELECT, INSERT, UPDATE ON dbTriage.patologia TO 'documento'@'192.168.3.6'
            GRANT SELECT, INSERT, UPDATE, DELETE ON dbTriage.asociados TO 'documento'@'192.168.3.6'
            GRANT SELECT, INSERT, UPDATE ON dbTriage.setting TO 'documento'@'%'
            FLUSH PRIVILEGES

/* SENTENCIAS DESDE VISUAL BASIC */

/* Creacion de usuario con permisis administrativos */
        Try
            Comando.CommandText = "GRANT ALL PRIVILEGES ON *.* TO '" & Me.Documento & "'@'" & Me.RangoIP & "' IDENTIFIED BY '" & gestorPass & "' WITH GRANT OPTION"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT, INSERT, UPDATE ON dbTriage.persona TO '" & Me.Documento & "'@'" & Me.RangoIP & "'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT, INSERT, UPDATE, DELETE ON dbTriage.telefono TO '" & Me.Documento & "'@'" & Me.RangoIP & "'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT, INSERT, UPDATE ON dbTriage.administrativo TO '" & Me.Documento & "'@'" & Me.RangoIP & "'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT, INSERT, UPDATE ON dbTriage.medico TO '" & Me.Documento & "'@'" & Me.RangoIP & "'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT, INSERT, UPDATE ON dbTriage.paciente TO '" & Me.Documento & "'@'" & Me.RangoIP & "'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT, INSERT, UPDATE, DELETE ON dbTriage.preexistentes TO '" & Me.Documento & "'@'" & Me.RangoIP & "'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT, INSERT, UPDATE ON dbTriage.sintoma TO '" & Me.Documento & "'@'" & Me.RangoIP & "'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT, INSERT, UPDATE, DELETE ON dbTriage.patologia TO '" & Me.Documento & "'@'" & Me.RangoIP & "'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT, INSERT, UPDATE ON dbTriage.asociados TO '" & Me.Documento & "'@'" & Me.RangoIP & "'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "FLUSH PRIVILEGES"
            Comando.ExecuteNonQuery()
        Catch ex As Exception
            MsgBox("No se pudo crear el usuario adminstrativo", vbCritical, "Error de usuario")
        End Try

/*Creacion de usuario con permisos de paciente*/
        Try
            Dim pacientePass As String = "Pa." & Me.Documento
            Comando.CommandText = "CREATE USER '" & Me.Documento & "'@'%' IDENTIFIED BY '" & pacientePass & "'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT ON dbTriage.persona TO '" & Me.Documento & "'@'%'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT ON dbTriage.medico TO '" & Me.Documento & "'@'%'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT ON dbTriage.paciente TO '" & Me.Documento & "'@'%'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT ON dbTriage.telefono TO '" & Me.Documento & "'@'%'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT, INSERT, UPDATE ON dbTriage.sesion TO '" & Me.Documento & "'@'%'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT ON dbTriage.sintoma TO '" & Me.Documento & "'@'%'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT ON dbTriage.patologia TO '" & Me.Documento & "'@'%'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT, INSERT, UPDATE ON dbTriage.chat TO '" & Me.Documento & "'@'%'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT, INSERT ON dbTriage.diagnostico TO '" & Me.Documento & "'@'%'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT INSERT ON dbTriage.recibe TO '" & Me.Documento & "'@'%'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT INSERT ON dbTriage.tiene TO '" & Me.Documento & "'@'%'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT ON dbTriage.asociados TO '" & Me.Documento & "'@'%'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "FLUSH PRIVILEGES"
            Comando.ExecuteNonQuery()

        Catch ex As Exception
            MsgBox("No se pudo crear el usuario paciente", vbCritical, "Error de Usuario")
        End Try

/*Creacion de usuarios con permisos de medico*/
            Comando.CommandText = "CREATE USER '" & Me.Documento & "'@'" & Me.RangoIpConexion & "' IDENTIFIED BY '" & medicoPass & "'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT ON dbTriage.persona TO '" & Me.Documento & "'@'" & RangoIpConexion & "'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT ON dbTriage.paciente TO '" & Me.Documento & "'@'" & RangoIpConexion & "'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT ON dbTriage.preexistentes TO '" & Me.Documento & "'@'" & RangoIpConexion & "'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT, UPDATE ON dbTriage.sesion TO '" & Me.Documento & "'@'" & RangoIpConexion & "'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT ON dbTriage.sintoma TO '" & Me.Documento & "'@'" & RangoIpConexion & "'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT, INSERT, UPDATE ON dbTriage.chat TO '" & Me.Documento & "'@'" & RangoIpConexion & "'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT ON dbTriage.recibe TO '" & Me.Documento & "'@'" & RangoIpConexion & "'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT ON dbTriage.tiene TO '" & Me.Documento & "'@'" & RangoIpConexion & "'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT ON dbTriage.medico TO '" & Me.Documento & "'@'" & RangoIpConexion & "'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "GRANT SELECT ON dbTriage.telefono TO '" & Me.Documento & "'@'" & RangoIpConexion & "'"
            Comando.ExecuteNonQuery()

            Comando.CommandText = "FLUSH PRIVILEGES"
            Comando.ExecuteNonQuery()

        Catch ex As Exception
            MsgBox("No se pudo crear el usuario medico", vbCritical, "Error de Usuario")
        End Try