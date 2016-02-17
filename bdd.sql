#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Utilisateur
#------------------------------------------------------------

CREATE TABLE Utilisateur(
        IDUtilisateur  Int NOT NULL ,
        Nom            Char (25) ,
        Prenom         Char (25) ,
        Role           Char (25) ,
        Administrateur Char (25) ,
        Utilisateur    Char (25) ,
        Lambda         Char (25) ,
        PRIMARY KEY (IDUtilisateur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Annonces
#------------------------------------------------------------

CREATE TABLE Annonces(
        IDAnnonce    Int NOT NULL ,
        DateCreation Datetime ,
        TexteMessage Text ,
        PRIMARY KEY (IDAnnonce )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Sport
#------------------------------------------------------------

CREATE TABLE Sport(
        IDSport        Int NOT NULL ,
        LibelleDuSport Char (25) ,
        PRIMARY KEY (IDSport )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: rencontre
#------------------------------------------------------------

CREATE TABLE rencontre(
        IDMatch      Int NOT NULL ,
        SportDuMatch Char (25) ,
        DateMatch    Int ,
        Resultat     Int ,
        Lieu         Char (25) ,
        IDSport      Int ,
        PRIMARY KEY (IDMatch )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Message
#------------------------------------------------------------

CREATE TABLE Message(
        IDmessage                        Int NOT NULL ,
        Message_a_ladministrateurmessage Text ,
        IDUtilisateur                    Int ,
        IDUtilisateur_1                  Int ,
        PRIMARY KEY (IDmessage )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Lier
#------------------------------------------------------------

CREATE TABLE Lier(
        IDAnnonce Int NOT NULL ,
        IDSport   Int NOT NULL ,
        PRIMARY KEY (IDAnnonce ,IDSport )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Répondre
#------------------------------------------------------------

CREATE TABLE Repondre(
        IDUtilisateur Int NOT NULL ,
        IDAnnonce     Int NOT NULL ,
        PRIMARY KEY (IDUtilisateur ,IDAnnonce )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: poster
#------------------------------------------------------------

CREATE TABLE poster(
        IDAnnonce     Int NOT NULL ,
        IDUtilisateur Int NOT NULL ,
        PRIMARY KEY (IDAnnonce ,IDUtilisateur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Organise
#------------------------------------------------------------

CREATE TABLE Organise(
        IDUtilisateur Int NOT NULL ,
        IDMatch       Int NOT NULL ,
        PRIMARY KEY (IDUtilisateur ,IDMatch )
)ENGINE=InnoDB;

ALTER TABLE rencontre ADD CONSTRAINT FK_rencontre_IDSport FOREIGN KEY (IDSport) REFERENCES Sport(IDSport);
ALTER TABLE Message ADD CONSTRAINT FK_Message_IDUtilisateur FOREIGN KEY (IDUtilisateur) REFERENCES Utilisateur(IDUtilisateur);
ALTER TABLE Message ADD CONSTRAINT FK_Message_IDUtilisateur_1 FOREIGN KEY (IDUtilisateur_1) REFERENCES Utilisateur(IDUtilisateur);
ALTER TABLE Lier ADD CONSTRAINT FK_Lier_IDAnnonce FOREIGN KEY (IDAnnonce) REFERENCES Annonces(IDAnnonce);
ALTER TABLE Lier ADD CONSTRAINT FK_Lier_IDSport FOREIGN KEY (IDSport) REFERENCES Sport(IDSport);
ALTER TABLE Repondre ADD CONSTRAINT FK_Repondre_IDUtilisateur FOREIGN KEY (IDUtilisateur) REFERENCES Utilisateur(IDUtilisateur);
ALTER TABLE Repondre ADD CONSTRAINT FK_Repondre_IDAnnonce FOREIGN KEY (IDAnnonce) REFERENCES Annonces(IDAnnonce);
ALTER TABLE poster ADD CONSTRAINT FK_poster_IDAnnonce FOREIGN KEY (IDAnnonce) REFERENCES Annonces(IDAnnonce);
ALTER TABLE poster ADD CONSTRAINT FK_poster_IDUtilisateur FOREIGN KEY (IDUtilisateur) REFERENCES Utilisateur(IDUtilisateur);
ALTER TABLE Organise ADD CONSTRAINT FK_Organise_IDUtilisateur FOREIGN KEY (IDUtilisateur) REFERENCES Utilisateur(IDUtilisateur);
ALTER TABLE Organise ADD CONSTRAINT FK_Organise_IDMatch FOREIGN KEY (IDMatch) REFERENCES rencontre(IDMatch);
