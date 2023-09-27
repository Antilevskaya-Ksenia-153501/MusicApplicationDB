# MusicApplicationDB
## Functional requrements
* User authorization.
* User management (CRUD).
* Role system.
* Logging of user actions.

1. Two different users(artist and listener),all users are authorized
2. After authorization, the listener can
  * select subscription type
  * create and manage their own playlists
  * discover new music
  * change information about themselves
3. After authorization, the artist can
  * create and upload their own music to the application
  * upload, modify, and delete their own songs and albums
  * view statistics and analytics related to their content
4. User actions must be logged

## Entities
1. Role
   * RoleID INT PRIMARY KEY NOT NULL,
   * RoleName VARCHAR(50) UNIQUE NOT NULL
2. User
   * UserID INT PRIMARY KEY NOT NULL,
   * Username VARCHAR(50) NOT NULL,
   * Password VARCHAR(100) NOT NULL,
   * FOREIGN KEY (RoleID) REFERENCES Role(RoleID) NOT NULL
3. Listener
   * ListenerID INT PRIMARY KEY NOT NULL,
   * FOREIGN KEY (UserID) REFERENCES User(UserID) NOT NULL,
   * FirstName VARCHAR(50) NOT NULL,
   * LastName VARCHAR(50) NOT NULL,
   * DateOfBirth DATE NOT NULL,
   * Email VARCHAR(100) ~ '.@.+..' NOT NULL,
   * Phone VARCHAR(13) ~ '+375[0-9]{9}' NOT NULL
4. Artist
   * ArtistID INT PRIMARY KEY NOT NULL,
   * FOREIGN KEY (UserID) REFERENCES User(UserID) NOT NULL,
   * FOREIGN KEY (LabelID) REFERENCES Label(LabelID) NULL,
   * Name VARCHAR(100) NOT NULL,
   * Biography TEXT NULL,
   * ImageURL VARCHAR(200) NOT NULL
5. Label
   * LabelID INT PRIMARY KEY NOT NULL,
   * Name VARCHAR(100) NOT NULL,
   * Description TEXT NOT NULL
6. Subscription
   * SubscriptionID INT PRIMARY KEY NOT NULL,
   * Name VARCHAR(100) NOT NULL,
   * Price DECIMAL(10, 2) NOT NULL,
   * Features TEXT NOT NULL
7. ListenerSubscription
   * ListenerSubscriptionID INT PRIMARY KEY NOT NULL,
   * FOREIGN KEY (SubscriptionID) REFERENCES Subscription(SubscriptionID) NOT NULL,
   * StartDate DATE NOT NULL,
   * EndDate DATE NOT NULL
8. PaymentMethod
   * PaymentMethodID INT PRIMARY KEY NOT NULL,
   * FOREIGN KEY (ListenerID) REFERENCES Listener(ListenerID) NOT NULL,
   * CardNumber INT(16) NOT NULL,
   * ExpiryDate DATE NOT NULL,
   * CVV INT(3) NOT NULL
9. Album
    * AlbumID INT PRIMARY KEY NOT NULL,
    * FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID) NOT NULL,
    * Title VARCHAR(70) NOT NULL,
    * ReleaseDate DATE NOT NULL,
    * CoverImageURL VARCHAR(200) NULL
10. Playlist
    * PlaylistID INT PRIMARY KEY NOT NULL,
    * FOREIGN KEY (ListenerID) REFERENCES Listener(ListenerID) NOT NULL,
    * Title VARCHAR(100) NOT NULL,
    * Description TEXT NULL,
    * CoverImageURL VARCHAR(200) NULL
11. Song
    * SongID INT PRIMARY KEY NOT NULL,
    * FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID) NOT NULL,
    * FOREIGN KEY (AlbumID) REFERENCES Artist(AlbumID) NULL,
    * Title VARCHAR(100) NOT NULL
12. PlaylistSong
    * PlaylistSongID INT PRIMARY KEY NOT NULL,
    * FOREIGN KEY (SongID) REFERENCES Song(SongID) NOT NULL,
    * FOREIGN KEY (PlaylistID) REFERENCES Playlist(PlaylistID) NOT NULL
13. Genre
    * GenreID INT PRIMARY KEY NOT NULL,
    * Type VARCHAR(100) UNIQUE NOT NULL
14. SongGenre
    * SongGenreID INT PRIMARY KEY NOT NULL,
    * FOREIGN KEY (SongID) REFERENCES Song(SongID) NOT NULL,
    * FOREIGN KEY (GenreID) REFERENCES Genre(GenreID) NOT NULL
