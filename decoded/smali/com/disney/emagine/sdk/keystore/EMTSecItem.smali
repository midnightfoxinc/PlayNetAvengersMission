.class public Lcom/disney/emagine/sdk/keystore/EMTSecItem;
.super Ljava/lang/Object;
.source "EMTSecItem.java"

# interfaces
.implements Lcom/disney/emagine/sdk/keystore/EMTKeyStoreKeys;


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static instance:Lcom/disney/emagine/sdk/keystore/EMTSecItem;


# instance fields
.field private keyStoreFilePath:Ljava/lang/String;

.field private mConsole:Lcom/disney/emagine/sdk/EMTConsole;

.field private mKeyStore:Ljava/security/KeyStore;

.field private mKeyStoreName:Ljava/lang/String;

.field private mKeyStorePassword:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 40
    const-class v0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 8

    .prologue
    const/4 v6, 0x0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    const-string v5, "eMagine.keystore"

    iput-object v5, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mKeyStoreName:Ljava/lang/String;

    .line 46
    const-string v5, "EmAGinE.KeySTORe~"

    iput-object v5, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mKeyStorePassword:Ljava/lang/String;

    .line 47
    iput-object v6, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->keyStoreFilePath:Ljava/lang/String;

    .line 51
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v5

    iput-object v5, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    .line 55
    :try_start_0
    invoke-static {}, Ljava/security/KeyStore;->getDefaultType()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v5

    iput-object v5, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mKeyStore:Ljava/security/KeyStore;

    .line 57
    invoke-static {}, Lcom/disney/emagine/sdk/EMTFileManager;->documentsDirectory()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 58
    .local v0, "documentsDir":Ljava/lang/String;
    iget-object v5, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mKeyStorePassword:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->toCharArray()[C

    move-result-object v4

    .line 61
    .local v4, "password":[C
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mKeyStoreName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->keyStoreFilePath:Ljava/lang/String;
    :try_end_0
    .catch Ljava/security/KeyStoreException; {:try_start_0 .. :try_end_0} :catch_1

    .line 65
    :try_start_1
    iget-object v5, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->keyStoreFilePath:Ljava/lang/String;

    invoke-static {v5}, Lcom/disney/emagine/sdk/EMTFileManager;->fileExistsAtPath(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 67
    new-instance v3, Ljava/io/FileInputStream;

    iget-object v5, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->keyStoreFilePath:Ljava/lang/String;

    invoke-direct {v3, v5}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 69
    .local v3, "is":Ljava/io/InputStream;
    iget-object v5, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mKeyStore:Ljava/security/KeyStore;

    invoke-virtual {v5, v3, v4}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 103
    .end local v0    # "documentsDir":Ljava/lang/String;
    .end local v3    # "is":Ljava/io/InputStream;
    .end local v4    # "password":[C
    :goto_0
    return-void

    .line 73
    .restart local v0    # "documentsDir":Ljava/lang/String;
    .restart local v4    # "password":[C
    :cond_0
    iget-object v5, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mKeyStore:Ljava/security/KeyStore;

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 75
    new-instance v2, Ljava/io/FileOutputStream;

    iget-object v5, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->keyStoreFilePath:Ljava/lang/String;

    invoke-direct {v2, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 77
    .local v2, "fos":Ljava/io/FileOutputStream;
    iget-object v5, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mKeyStore:Ljava/security/KeyStore;

    invoke-virtual {v5, v2, v4}, Ljava/security/KeyStore;->store(Ljava/io/OutputStream;[C)V

    .line 78
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/security/cert/CertificateException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/security/KeyStoreException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 81
    .end local v2    # "fos":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v1

    .line 83
    .local v1, "e":Ljava/io/FileNotFoundException;
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V
    :try_end_2
    .catch Ljava/security/KeyStoreException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 98
    .end local v0    # "documentsDir":Ljava/lang/String;
    .end local v1    # "e":Ljava/io/FileNotFoundException;
    .end local v4    # "password":[C
    :catch_1
    move-exception v1

    .line 100
    .local v1, "e":Ljava/security/KeyStoreException;
    invoke-virtual {v1}, Ljava/security/KeyStoreException;->printStackTrace()V

    goto :goto_0

    .line 85
    .end local v1    # "e":Ljava/security/KeyStoreException;
    .restart local v0    # "documentsDir":Ljava/lang/String;
    .restart local v4    # "password":[C
    :catch_2
    move-exception v1

    .line 87
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    :try_start_3
    invoke-virtual {v1}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto :goto_0

    .line 89
    .end local v1    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_3
    move-exception v1

    .line 91
    .local v1, "e":Ljava/security/cert/CertificateException;
    invoke-virtual {v1}, Ljava/security/cert/CertificateException;->printStackTrace()V

    goto :goto_0

    .line 93
    .end local v1    # "e":Ljava/security/cert/CertificateException;
    :catch_4
    move-exception v1

    .line 95
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_3
    .catch Ljava/security/KeyStoreException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0
.end method

.method private getEntry(Ljava/lang/String;)Ljava/lang/Object;
    .locals 13
    .param p1, "alias"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    .line 367
    const/4 v5, 0x0

    .line 368
    .local v5, "secretObj":Ljava/lang/Object;
    const/4 v4, 0x0

    .line 370
    .local v4, "secret":[B
    iget-object v9, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mKeyStore:Ljava/security/KeyStore;

    if-eqz v9, :cond_0

    .line 374
    :try_start_0
    iget-object v9, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mKeyStore:Ljava/security/KeyStore;

    invoke-virtual {v9, p1}, Ljava/security/KeyStore;->containsAlias(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 376
    iget-object v9, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v10, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Keystore "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mKeyStoreName:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " does not contain entry "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lcom/disney/emagine/sdk/EMTConsole;->logw(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/security/KeyStoreException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v5, v8

    .line 425
    .end local v5    # "secretObj":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-object v5

    .line 381
    .restart local v5    # "secretObj":Ljava/lang/Object;
    :catch_0
    move-exception v2

    .line 383
    .local v2, "ex":Ljava/security/KeyStoreException;
    iget-object v9, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v10, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Failed to read keystore entry "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 387
    .end local v2    # "ex":Ljava/security/KeyStoreException;
    :cond_1
    new-instance v3, Ljava/security/KeyStore$PasswordProtection;

    invoke-direct {v3, v8}, Ljava/security/KeyStore$PasswordProtection;-><init>([C)V

    .line 388
    .local v3, "pp":Ljava/security/KeyStore$ProtectionParameter;
    const/4 v6, 0x0

    .line 392
    .local v6, "ske":Ljava/security/KeyStore$SecretKeyEntry;
    :try_start_1
    iget-object v8, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mKeyStore:Ljava/security/KeyStore;

    invoke-virtual {v8, p1, v3}, Ljava/security/KeyStore;->getEntry(Ljava/lang/String;Ljava/security/KeyStore$ProtectionParameter;)Ljava/security/KeyStore$Entry;

    move-result-object v8

    move-object v0, v8

    check-cast v0, Ljava/security/KeyStore$SecretKeyEntry;

    move-object v6, v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 399
    :goto_1
    if-eqz v6, :cond_3

    .line 401
    invoke-virtual {v6}, Ljava/security/KeyStore$SecretKeyEntry;->getSecretKey()Ljavax/crypto/SecretKey;

    move-result-object v7

    check-cast v7, Ljavax/crypto/spec/SecretKeySpec;

    .line 403
    .local v7, "sks":Ljavax/crypto/spec/SecretKeySpec;
    invoke-virtual {v7}, Ljavax/crypto/spec/SecretKeySpec;->getEncoded()[B

    move-result-object v4

    .line 405
    if-eqz v4, :cond_2

    .line 408
    :try_start_2
    new-instance v8, Ljava/io/ObjectInputStream;

    new-instance v9, Ljava/io/ByteArrayInputStream;

    invoke-direct {v9, v4}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v8, v9}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v8}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v5

    goto :goto_0

    .line 394
    .end local v7    # "sks":Ljavax/crypto/spec/SecretKeySpec;
    :catch_1
    move-exception v2

    .line 396
    .local v2, "ex":Ljava/lang/Exception;
    iget-object v8, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v9, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Failed to read keystore entry "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 409
    .end local v2    # "ex":Ljava/lang/Exception;
    .restart local v7    # "sks":Ljavax/crypto/spec/SecretKeySpec;
    :catch_2
    move-exception v1

    .line 411
    .local v1, "e":Ljava/lang/Exception;
    iget-object v8, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v9, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Error deserializing object from keystore: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 416
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_2
    iget-object v8, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v9, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Read empty keystore entry "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 421
    .end local v7    # "sks":Ljavax/crypto/spec/SecretKeySpec;
    :cond_3
    iget-object v8, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v9, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Failed to read keystore entry "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private saveKeyStore()Z
    .locals 8

    .prologue
    .line 430
    const/4 v1, 0x0

    .line 431
    .local v1, "fos":Ljava/io/FileOutputStream;
    const/4 v3, 0x1

    .line 435
    .local v3, "keyStoreSaved":Z
    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    iget-object v4, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->keyStoreFilePath:Ljava/lang/String;

    invoke-direct {v2, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 437
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    .local v2, "fos":Ljava/io/FileOutputStream;
    :try_start_1
    iget-object v4, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mKeyStore:Ljava/security/KeyStore;

    iget-object v5, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mKeyStorePassword:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->toCharArray()[C

    move-result-object v5

    invoke-virtual {v4, v2, v5}, Ljava/security/KeyStore;->store(Ljava/io/OutputStream;[C)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 447
    if-eqz v2, :cond_2

    .line 451
    :try_start_2
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    move-object v1, v2

    .line 462
    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v1    # "fos":Ljava/io/FileOutputStream;
    :cond_0
    :goto_0
    return v3

    .line 453
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v0

    .line 455
    .local v0, "ex":Ljava/io/IOException;
    const/4 v3, 0x0

    .line 457
    iget-object v4, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v5, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->TAG:Ljava/lang/String;

    const-string v6, "Failed to close FileOutputStream"

    invoke-virtual {v4, v5, v6}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    move-object v1, v2

    .line 458
    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v1    # "fos":Ljava/io/FileOutputStream;
    goto :goto_0

    .line 439
    .end local v0    # "ex":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 441
    .local v0, "ex":Ljava/lang/Exception;
    :goto_1
    const/4 v3, 0x0

    .line 443
    :try_start_3
    iget-object v4, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v5, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Failed to save keystore "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mKeyStoreName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 447
    if-eqz v1, :cond_0

    .line 451
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_0

    .line 453
    :catch_2
    move-exception v0

    .line 455
    .local v0, "ex":Ljava/io/IOException;
    const/4 v3, 0x0

    .line 457
    iget-object v4, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v5, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->TAG:Ljava/lang/String;

    const-string v6, "Failed to close FileOutputStream"

    invoke-virtual {v4, v5, v6}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 447
    .end local v0    # "ex":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    :goto_2
    if-eqz v1, :cond_1

    .line 451
    :try_start_5
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 458
    :cond_1
    :goto_3
    throw v4

    .line 453
    :catch_3
    move-exception v0

    .line 455
    .restart local v0    # "ex":Ljava/io/IOException;
    const/4 v3, 0x0

    .line 457
    iget-object v5, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v6, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->TAG:Ljava/lang/String;

    const-string v7, "Failed to close FileOutputStream"

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 447
    .end local v0    # "ex":Ljava/io/IOException;
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v4

    move-object v1, v2

    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v1    # "fos":Ljava/io/FileOutputStream;
    goto :goto_2

    .line 439
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    :catch_4
    move-exception v0

    move-object v1, v2

    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v1    # "fos":Ljava/io/FileOutputStream;
    goto :goto_1

    .end local v1    # "fos":Ljava/io/FileOutputStream;
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    :cond_2
    move-object v1, v2

    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v1    # "fos":Ljava/io/FileOutputStream;
    goto :goto_0
.end method

.method private setEntry(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 10
    .param p1, "alias"    # Ljava/lang/String;
    .param p2, "secretKey"    # Ljava/lang/String;

    .prologue
    .line 303
    const/4 v1, 0x0

    .line 305
    .local v1, "keyStoreEntryWritten":Z
    iget-object v6, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mKeyStore:Ljava/security/KeyStore;

    if-eqz v6, :cond_0

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_0

    .line 308
    new-instance v4, Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    const-string v7, "MD5"

    invoke-direct {v4, v6, v7}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 309
    .local v4, "sks":Ljavax/crypto/spec/SecretKeySpec;
    new-instance v3, Ljava/security/KeyStore$SecretKeyEntry;

    invoke-direct {v3, v4}, Ljava/security/KeyStore$SecretKeyEntry;-><init>(Ljavax/crypto/SecretKey;)V

    .line 310
    .local v3, "ske":Ljava/security/KeyStore$SecretKeyEntry;
    new-instance v2, Ljava/security/KeyStore$PasswordProtection;

    const/4 v6, 0x0

    invoke-direct {v2, v6}, Ljava/security/KeyStore$PasswordProtection;-><init>([C)V

    .line 314
    .local v2, "pp":Ljava/security/KeyStore$ProtectionParameter;
    :try_start_0
    iget-object v6, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mKeyStore:Ljava/security/KeyStore;

    invoke-virtual {v6, p1, v3, v2}, Ljava/security/KeyStore;->setEntry(Ljava/lang/String;Ljava/security/KeyStore$Entry;Ljava/security/KeyStore$ProtectionParameter;)V

    .line 317
    invoke-direct {p0}, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->saveKeyStore()Z
    :try_end_0
    .catch Ljava/security/KeyStoreException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    .line 319
    .local v5, "success":Z
    if-eqz v5, :cond_0

    .line 321
    const/4 v1, 0x1

    .line 330
    .end local v2    # "pp":Ljava/security/KeyStore$ProtectionParameter;
    .end local v3    # "ske":Ljava/security/KeyStore$SecretKeyEntry;
    .end local v4    # "sks":Ljavax/crypto/spec/SecretKeySpec;
    .end local v5    # "success":Z
    :cond_0
    :goto_0
    return v1

    .line 324
    .restart local v2    # "pp":Ljava/security/KeyStore$ProtectionParameter;
    .restart local v3    # "ske":Ljava/security/KeyStore$SecretKeyEntry;
    .restart local v4    # "sks":Ljavax/crypto/spec/SecretKeySpec;
    :catch_0
    move-exception v0

    .line 326
    .local v0, "ex":Ljava/security/KeyStoreException;
    iget-object v6, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Failed to read keystore"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mKeyStoreName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private setEntry(Ljava/lang/String;[B)Z
    .locals 10
    .param p1, "alias"    # Ljava/lang/String;
    .param p2, "secretKey"    # [B

    .prologue
    .line 335
    const/4 v1, 0x0

    .line 337
    .local v1, "keyStoreEntryWritten":Z
    iget-object v6, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mKeyStore:Ljava/security/KeyStore;

    if-eqz v6, :cond_0

    if-eqz p2, :cond_0

    array-length v6, p2

    if-eqz v6, :cond_0

    .line 340
    new-instance v4, Ljavax/crypto/spec/SecretKeySpec;

    const-string v6, "MD5"

    invoke-direct {v4, p2, v6}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 341
    .local v4, "sks":Ljavax/crypto/spec/SecretKeySpec;
    new-instance v3, Ljava/security/KeyStore$SecretKeyEntry;

    invoke-direct {v3, v4}, Ljava/security/KeyStore$SecretKeyEntry;-><init>(Ljavax/crypto/SecretKey;)V

    .line 342
    .local v3, "ske":Ljava/security/KeyStore$SecretKeyEntry;
    new-instance v2, Ljava/security/KeyStore$PasswordProtection;

    const/4 v6, 0x0

    invoke-direct {v2, v6}, Ljava/security/KeyStore$PasswordProtection;-><init>([C)V

    .line 346
    .local v2, "pp":Ljava/security/KeyStore$ProtectionParameter;
    :try_start_0
    iget-object v6, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mKeyStore:Ljava/security/KeyStore;

    invoke-virtual {v6, p1, v3, v2}, Ljava/security/KeyStore;->setEntry(Ljava/lang/String;Ljava/security/KeyStore$Entry;Ljava/security/KeyStore$ProtectionParameter;)V

    .line 349
    invoke-direct {p0}, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->saveKeyStore()Z
    :try_end_0
    .catch Ljava/security/KeyStoreException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    .line 351
    .local v5, "success":Z
    if-eqz v5, :cond_0

    .line 353
    const/4 v1, 0x1

    .line 362
    .end local v2    # "pp":Ljava/security/KeyStore$ProtectionParameter;
    .end local v3    # "ske":Ljava/security/KeyStore$SecretKeyEntry;
    .end local v4    # "sks":Ljavax/crypto/spec/SecretKeySpec;
    .end local v5    # "success":Z
    :cond_0
    :goto_0
    return v1

    .line 356
    .restart local v2    # "pp":Ljava/security/KeyStore$ProtectionParameter;
    .restart local v3    # "ske":Ljava/security/KeyStore$SecretKeyEntry;
    .restart local v4    # "sks":Ljavax/crypto/spec/SecretKeySpec;
    :catch_0
    move-exception v0

    .line 358
    .local v0, "ex":Ljava/security/KeyStoreException;
    iget-object v6, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Failed to read keystore"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mKeyStoreName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static sharedInstance()Lcom/disney/emagine/sdk/keystore/EMTSecItem;
    .locals 1

    .prologue
    .line 107
    sget-object v0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->instance:Lcom/disney/emagine/sdk/keystore/EMTSecItem;

    if-nez v0, :cond_0

    .line 109
    new-instance v0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/keystore/EMTSecItem;-><init>()V

    sput-object v0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->instance:Lcom/disney/emagine/sdk/keystore/EMTSecItem;

    .line 112
    :cond_0
    sget-object v0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->instance:Lcom/disney/emagine/sdk/keystore/EMTSecItem;

    return-object v0
.end method


# virtual methods
.method public add(Ljava/util/HashMap;)I
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 208
    .local p1, "attributes":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v8, "kSecAttrAccessGroup"

    invoke-virtual {p1, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 209
    .local v0, "accessGroup":Ljava/lang/String;
    const-string v8, "kSecAttrService"

    invoke-virtual {p1, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 210
    .local v6, "serviceName":Ljava/lang/String;
    const-string v8, "kSecAttrAccount"

    invoke-virtual {p1, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 211
    .local v4, "key":Ljava/lang/String;
    const-string v8, "kSecValueData"

    invoke-virtual {p1, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 213
    .local v7, "value":Ljava/lang/Object;
    if-nez v6, :cond_0

    .line 215
    const/4 v8, 0x1

    .line 260
    .end local v7    # "value":Ljava/lang/Object;
    :goto_0
    return v8

    .line 218
    .restart local v7    # "value":Ljava/lang/Object;
    :cond_0
    if-eqz v4, :cond_4

    .line 220
    if-eqz v7, :cond_3

    .line 222
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 224
    .local v1, "alias":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 226
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 229
    :cond_1
    instance-of v8, v7, Ljava/lang/String;

    if-eqz v8, :cond_2

    .line 231
    check-cast v7, Ljava/lang/String;

    .end local v7    # "value":Ljava/lang/Object;
    invoke-direct {p0, v1, v7}, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->setEntry(Ljava/lang/String;Ljava/lang/String;)Z

    .line 254
    .end local v1    # "alias":Ljava/lang/String;
    :goto_1
    invoke-direct {p0}, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->saveKeyStore()Z

    move-result v8

    if-nez v8, :cond_4

    .line 256
    const/4 v8, 0x2

    goto :goto_0

    .line 235
    .restart local v1    # "alias":Ljava/lang/String;
    .restart local v7    # "value":Ljava/lang/Object;
    :cond_2
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 237
    .local v2, "binary":Ljava/io/ByteArrayOutputStream;
    :try_start_0
    new-instance v5, Ljava/io/ObjectOutputStream;

    invoke-direct {v5, v2}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 238
    .local v5, "oos":Ljava/io/ObjectOutputStream;
    invoke-virtual {v5, v7}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 239
    invoke-virtual {v5}, Ljava/io/ObjectOutputStream;->flush()V

    .line 241
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v8

    invoke-direct {p0, v1, v8}, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->setEntry(Ljava/lang/String;[B)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 242
    .end local v5    # "oos":Ljava/io/ObjectOutputStream;
    :catch_0
    move-exception v3

    .line 244
    .local v3, "e":Ljava/io/IOException;
    iget-object v8, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v9, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->TAG:Ljava/lang/String;

    const-string v10, "IO Exception writing object to keychain"

    invoke-virtual {v8, v9, v10}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 245
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 251
    .end local v1    # "alias":Ljava/lang/String;
    .end local v2    # "binary":Ljava/io/ByteArrayOutputStream;
    .end local v3    # "e":Ljava/io/IOException;
    :cond_3
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->delete(Ljava/util/HashMap;)I

    goto :goto_1

    .line 260
    .end local v7    # "value":Ljava/lang/Object;
    :cond_4
    const/4 v8, 0x0

    goto :goto_0
.end method

.method public copyMatching(Ljava/util/HashMap;)Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 145
    .local p1, "query":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "kSecAttrService"

    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 147
    .local v2, "serviceName":Ljava/lang/String;
    if-nez v2, :cond_1

    .line 149
    const/4 v0, 0x0

    .line 160
    :cond_0
    :goto_0
    return-object v0

    .line 152
    :cond_1
    invoke-direct {p0, v2}, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->getEntry(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 153
    .local v1, "service":Ljava/lang/String;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 155
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    if-eqz v1, :cond_0

    .line 157
    invoke-static {v1}, Lcom/disney/emagine/sdk/json/EMTJson;->hashMapFromJsonString(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public delete(Ljava/util/HashMap;)I
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 265
    .local p1, "attributes":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v5, "kSecAttrAccessGroup"

    invoke-virtual {p1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 266
    .local v0, "accessGroup":Ljava/lang/String;
    const-string v5, "kSecAttrService"

    invoke-virtual {p1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 267
    .local v4, "serviceName":Ljava/lang/String;
    const-string v5, "kSecAttrAccount"

    invoke-virtual {p1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 269
    .local v3, "key":Ljava/lang/String;
    if-nez v4, :cond_0

    .line 271
    const/4 v5, 0x1

    .line 298
    :goto_0
    return v5

    .line 274
    :cond_0
    if-eqz v3, :cond_2

    .line 276
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 278
    .local v1, "alias":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 280
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 285
    :cond_1
    :try_start_0
    iget-object v5, p0, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->mKeyStore:Ljava/security/KeyStore;

    invoke-virtual {v5, v1}, Ljava/security/KeyStore;->deleteEntry(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/security/KeyStoreException; {:try_start_0 .. :try_end_0} :catch_0

    .line 293
    .end local v1    # "alias":Ljava/lang/String;
    :cond_2
    :goto_1
    invoke-direct {p0}, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->saveKeyStore()Z

    move-result v5

    if-nez v5, :cond_3

    .line 295
    const/4 v5, 0x2

    goto :goto_0

    .line 287
    .restart local v1    # "alias":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 289
    .local v2, "e":Ljava/security/KeyStoreException;
    invoke-virtual {v2}, Ljava/security/KeyStoreException;->printStackTrace()V

    goto :goto_1

    .line 298
    .end local v1    # "alias":Ljava/lang/String;
    .end local v2    # "e":Ljava/security/KeyStoreException;
    :cond_3
    const/4 v5, 0x0

    goto :goto_0
.end method

.method public getData(Ljava/util/HashMap;)[B
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)[B"
        }
    .end annotation

    .prologue
    .local p1, "query":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v5, 0x0

    .line 117
    const-string v6, "kSecAttrAccessGroup"

    invoke-virtual {p1, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 118
    .local v0, "accessGroup":Ljava/lang/String;
    const-string v6, "kSecAttrService"

    invoke-virtual {p1, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 119
    .local v3, "serviceName":Ljava/lang/String;
    const-string v6, "kSecAttrAccount"

    invoke-virtual {p1, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 121
    .local v2, "key":Ljava/lang/String;
    if-nez v3, :cond_0

    move-object v4, v5

    .line 140
    :goto_0
    return-object v4

    .line 126
    :cond_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 128
    .local v1, "alias":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 130
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 133
    :cond_1
    invoke-direct {p0, v1}, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->getEntry(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 135
    .local v4, "value":Ljava/lang/Object;
    if-nez v4, :cond_2

    move-object v4, v5

    .line 137
    goto :goto_0

    .line 140
    :cond_2
    check-cast v4, [B

    .end local v4    # "value":Ljava/lang/Object;
    check-cast v4, [B

    goto :goto_0
.end method

.method public update(Ljava/util/HashMap;)I
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)I"
        }
    .end annotation

    .prologue
    .local p1, "attributes":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v6, 0x2

    .line 165
    const-string v7, "kSecAttrAccessGroup"

    invoke-virtual {p1, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 166
    .local v0, "accessGroup":Ljava/lang/String;
    const-string v7, "kSecAttrService"

    invoke-virtual {p1, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 167
    .local v4, "serviceName":Ljava/lang/String;
    const-string v7, "kSecAttrAccount"

    invoke-virtual {p1, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 168
    .local v3, "key":Ljava/lang/String;
    const-string v7, "kSecValueData"

    invoke-virtual {p1, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 170
    .local v5, "value":Ljava/lang/Object;
    if-nez v4, :cond_1

    .line 172
    const/4 v6, 0x1

    .line 203
    .end local v5    # "value":Ljava/lang/Object;
    :cond_0
    :goto_0
    return v6

    .line 175
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_1
    if-eqz v3, :cond_0

    if-eqz v5, :cond_0

    .line 177
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 179
    .local v1, "alias":Ljava/lang/String;
    if-eqz v0, :cond_2

    .line 181
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 184
    :cond_2
    instance-of v7, v5, Ljava/lang/String;

    if-eqz v7, :cond_3

    .line 186
    check-cast v5, Ljava/lang/String;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-direct {p0, v1, v5}, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->setEntry(Ljava/lang/String;Ljava/lang/String;)Z

    .line 195
    :goto_1
    invoke-direct {p0}, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->saveKeyStore()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 200
    const/4 v6, 0x0

    goto :goto_0

    .line 190
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_3
    check-cast v5, [B

    .end local v5    # "value":Ljava/lang/Object;
    move-object v2, v5

    check-cast v2, [B

    .line 192
    .local v2, "entry":[B
    invoke-direct {p0, v1, v2}, Lcom/disney/emagine/sdk/keystore/EMTSecItem;->setEntry(Ljava/lang/String;[B)Z

    goto :goto_1
.end method
