.class public Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;
.super Ljava/lang/Object;
.source "SpnegoEngine.java"


# static fields
.field public static final INSTANCE:Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;

.field private static final KERBEROS_OID:Ljava/lang/String; = "1.2.840.113554.1.2.2"

.field private static final SPNEGO_OID:Ljava/lang/String; = "1.3.6.1.5.5.2"


# instance fields
.field private final log:Lorg/slf4j/Logger;

.field private final spnegoGenerator:Lcom/ning/http/client/providers/netty/spnego/SpnegoTokenGenerator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 67
    new-instance v0, Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;

    invoke-direct {v0}, Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;-><init>()V

    sput-object v0, Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;->INSTANCE:Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 74
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;-><init>(Lcom/ning/http/client/providers/netty/spnego/SpnegoTokenGenerator;)V

    .line 75
    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/providers/netty/spnego/SpnegoTokenGenerator;)V
    .locals 1
    .param p1, "spnegoGenerator"    # Lcom/ning/http/client/providers/netty/spnego/SpnegoTokenGenerator;

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;->log:Lorg/slf4j/Logger;

    .line 70
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;->spnegoGenerator:Lcom/ning/http/client/providers/netty/spnego/SpnegoTokenGenerator;

    .line 71
    return-void
.end method


# virtual methods
.method public generateToken(Ljava/lang/String;)Ljava/lang/String;
    .locals 12
    .param p1, "server"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 80
    :try_start_0
    iget-object v9, p0, Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;->log:Lorg/slf4j/Logger;

    const-string v10, "init {}"

    invoke-interface {v9, v10, p1}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    .line 95
    const/4 v1, 0x0

    .line 96
    .local v1, "gssContext":Lorg/ietf/jgss/GSSContext;
    const/4 v6, 0x0

    .line 97
    .local v6, "token":[B
    const/4 v4, 0x0

    .line 100
    .local v4, "negotiationOid":Lorg/ietf/jgss/Oid;
    new-instance v4, Lorg/ietf/jgss/Oid;

    .end local v4    # "negotiationOid":Lorg/ietf/jgss/Oid;
    const-string v9, "1.3.6.1.5.5.2"

    invoke-direct {v4, v9}, Lorg/ietf/jgss/Oid;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/ietf/jgss/GSSException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 102
    .restart local v4    # "negotiationOid":Lorg/ietf/jgss/Oid;
    const/4 v8, 0x0

    .line 104
    .local v8, "tryKerberos":Z
    :try_start_1
    invoke-static {}, Lorg/ietf/jgss/GSSManager;->getInstance()Lorg/ietf/jgss/GSSManager;

    move-result-object v3

    .line 105
    .local v3, "manager":Lorg/ietf/jgss/GSSManager;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "HTTP@"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    sget-object v10, Lorg/ietf/jgss/GSSName;->NT_HOSTBASED_SERVICE:Lorg/ietf/jgss/Oid;

    invoke-virtual {v3, v9, v10}, Lorg/ietf/jgss/GSSManager;->createName(Ljava/lang/String;Lorg/ietf/jgss/Oid;)Lorg/ietf/jgss/GSSName;

    move-result-object v5

    .line 106
    .local v5, "serverName":Lorg/ietf/jgss/GSSName;
    invoke-interface {v5, v4}, Lorg/ietf/jgss/GSSName;->canonicalize(Lorg/ietf/jgss/Oid;)Lorg/ietf/jgss/GSSName;

    move-result-object v9

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual {v3, v9, v4, v10, v11}, Lorg/ietf/jgss/GSSManager;->createContext(Lorg/ietf/jgss/GSSName;Lorg/ietf/jgss/Oid;Lorg/ietf/jgss/GSSCredential;I)Lorg/ietf/jgss/GSSContext;

    move-result-object v1

    .line 109
    const/4 v9, 0x1

    invoke-interface {v1, v9}, Lorg/ietf/jgss/GSSContext;->requestMutualAuth(Z)V

    .line 110
    const/4 v9, 0x1

    invoke-interface {v1, v9}, Lorg/ietf/jgss/GSSContext;->requestCredDeleg(Z)V
    :try_end_1
    .catch Lorg/ietf/jgss/GSSException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 123
    .end local v3    # "manager":Lorg/ietf/jgss/GSSManager;
    .end local v5    # "serverName":Lorg/ietf/jgss/GSSName;
    :goto_0
    if-eqz v8, :cond_0

    .line 125
    :try_start_2
    iget-object v9, p0, Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;->log:Lorg/slf4j/Logger;

    const-string v10, "Using Kerberos MECH {}"

    const-string v11, "1.2.840.113554.1.2.2"

    invoke-interface {v9, v10, v11}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    .line 126
    new-instance v4, Lorg/ietf/jgss/Oid;

    .end local v4    # "negotiationOid":Lorg/ietf/jgss/Oid;
    const-string v9, "1.2.840.113554.1.2.2"

    invoke-direct {v4, v9}, Lorg/ietf/jgss/Oid;-><init>(Ljava/lang/String;)V

    .line 127
    .restart local v4    # "negotiationOid":Lorg/ietf/jgss/Oid;
    invoke-static {}, Lorg/ietf/jgss/GSSManager;->getInstance()Lorg/ietf/jgss/GSSManager;

    move-result-object v3

    .line 128
    .restart local v3    # "manager":Lorg/ietf/jgss/GSSManager;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "HTTP@"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    sget-object v10, Lorg/ietf/jgss/GSSName;->NT_HOSTBASED_SERVICE:Lorg/ietf/jgss/Oid;

    invoke-virtual {v3, v9, v10}, Lorg/ietf/jgss/GSSManager;->createName(Ljava/lang/String;Lorg/ietf/jgss/Oid;)Lorg/ietf/jgss/GSSName;

    move-result-object v5

    .line 129
    .restart local v5    # "serverName":Lorg/ietf/jgss/GSSName;
    invoke-interface {v5, v4}, Lorg/ietf/jgss/GSSName;->canonicalize(Lorg/ietf/jgss/Oid;)Lorg/ietf/jgss/GSSName;

    move-result-object v9

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual {v3, v9, v4, v10, v11}, Lorg/ietf/jgss/GSSManager;->createContext(Lorg/ietf/jgss/GSSName;Lorg/ietf/jgss/Oid;Lorg/ietf/jgss/GSSCredential;I)Lorg/ietf/jgss/GSSContext;

    move-result-object v1

    .line 132
    const/4 v9, 0x1

    invoke-interface {v1, v9}, Lorg/ietf/jgss/GSSContext;->requestMutualAuth(Z)V

    .line 133
    const/4 v9, 0x1

    invoke-interface {v1, v9}, Lorg/ietf/jgss/GSSContext;->requestCredDeleg(Z)V

    .line 137
    .end local v3    # "manager":Lorg/ietf/jgss/GSSManager;
    .end local v5    # "serverName":Lorg/ietf/jgss/GSSName;
    :cond_0
    if-nez v6, :cond_1

    .line 138
    const/4 v9, 0x0

    new-array v6, v9, [B

    .line 141
    :cond_1
    const/4 v9, 0x0

    array-length v10, v6

    invoke-interface {v1, v6, v9, v10}, Lorg/ietf/jgss/GSSContext;->initSecContext([BII)[B

    move-result-object v6

    .line 142
    if-nez v6, :cond_4

    .line 143
    new-instance v9, Ljava/lang/Exception;

    const-string v10, "GSS security context initialization failed"

    invoke-direct {v9, v10}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_2
    .catch Lorg/ietf/jgss/GSSException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 160
    .end local v1    # "gssContext":Lorg/ietf/jgss/GSSContext;
    .end local v4    # "negotiationOid":Lorg/ietf/jgss/Oid;
    .end local v6    # "token":[B
    .end local v8    # "tryKerberos":Z
    :catch_0
    move-exception v2

    .line 161
    .local v2, "gsse":Lorg/ietf/jgss/GSSException;
    iget-object v9, p0, Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;->log:Lorg/slf4j/Logger;

    const-string v10, "generateToken"

    invoke-interface {v9, v10, v2}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 162
    invoke-virtual {v2}, Lorg/ietf/jgss/GSSException;->getMajor()I

    move-result v9

    const/16 v10, 0x9

    if-eq v9, v10, :cond_2

    invoke-virtual {v2}, Lorg/ietf/jgss/GSSException;->getMajor()I

    move-result v9

    const/16 v10, 0x8

    if-ne v9, v10, :cond_6

    .line 164
    :cond_2
    new-instance v9, Ljava/lang/Exception;

    invoke-virtual {v2}, Lorg/ietf/jgss/GSSException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 111
    .end local v2    # "gsse":Lorg/ietf/jgss/GSSException;
    .restart local v1    # "gssContext":Lorg/ietf/jgss/GSSContext;
    .restart local v4    # "negotiationOid":Lorg/ietf/jgss/Oid;
    .restart local v6    # "token":[B
    .restart local v8    # "tryKerberos":Z
    :catch_1
    move-exception v0

    .line 112
    .local v0, "ex":Lorg/ietf/jgss/GSSException;
    :try_start_3
    iget-object v9, p0, Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;->log:Lorg/slf4j/Logger;

    const-string v10, "generateToken"

    invoke-interface {v9, v10, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 115
    invoke-virtual {v0}, Lorg/ietf/jgss/GSSException;->getMajor()I

    move-result v9

    const/4 v10, 0x2

    if-ne v9, v10, :cond_3

    .line 116
    iget-object v9, p0, Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;->log:Lorg/slf4j/Logger;

    const-string v10, "GSSException BAD_MECH, retry with Kerberos MECH"

    invoke-interface {v9, v10}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 117
    const/4 v8, 0x1

    goto/16 :goto_0

    .line 119
    :cond_3
    throw v0
    :try_end_3
    .catch Lorg/ietf/jgss/GSSException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 173
    .end local v0    # "ex":Lorg/ietf/jgss/GSSException;
    .end local v1    # "gssContext":Lorg/ietf/jgss/GSSContext;
    .end local v4    # "negotiationOid":Lorg/ietf/jgss/Oid;
    .end local v6    # "token":[B
    .end local v8    # "tryKerberos":Z
    :catch_2
    move-exception v0

    .line 174
    .local v0, "ex":Ljava/io/IOException;
    new-instance v9, Ljava/lang/Exception;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v9

    .line 150
    .end local v0    # "ex":Ljava/io/IOException;
    .restart local v1    # "gssContext":Lorg/ietf/jgss/GSSContext;
    .restart local v4    # "negotiationOid":Lorg/ietf/jgss/Oid;
    .restart local v6    # "token":[B
    .restart local v8    # "tryKerberos":Z
    :cond_4
    :try_start_4
    iget-object v9, p0, Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;->spnegoGenerator:Lcom/ning/http/client/providers/netty/spnego/SpnegoTokenGenerator;

    if-eqz v9, :cond_5

    invoke-virtual {v4}, Lorg/ietf/jgss/Oid;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v10, "1.2.840.113554.1.2.2"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 151
    iget-object v9, p0, Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;->spnegoGenerator:Lcom/ning/http/client/providers/netty/spnego/SpnegoTokenGenerator;

    invoke-interface {v9, v6}, Lcom/ning/http/client/providers/netty/spnego/SpnegoTokenGenerator;->generateSpnegoDERObject([B)[B

    move-result-object v6

    .line 154
    :cond_5
    invoke-interface {v1}, Lorg/ietf/jgss/GSSContext;->dispose()V

    .line 156
    new-instance v7, Ljava/lang/String;

    invoke-static {v6}, Lcom/ning/http/util/Base64;->encode([B)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v7, v9}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 157
    .local v7, "tokenstr":Ljava/lang/String;
    iget-object v9, p0, Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;->log:Lorg/slf4j/Logger;

    const-string v10, "Sending response \'{}\' back to the server"

    invoke-interface {v9, v10, v7}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_4
    .catch Lorg/ietf/jgss/GSSException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 159
    return-object v7

    .line 165
    .end local v1    # "gssContext":Lorg/ietf/jgss/GSSContext;
    .end local v4    # "negotiationOid":Lorg/ietf/jgss/Oid;
    .end local v6    # "token":[B
    .end local v7    # "tokenstr":Ljava/lang/String;
    .end local v8    # "tryKerberos":Z
    .restart local v2    # "gsse":Lorg/ietf/jgss/GSSException;
    :cond_6
    invoke-virtual {v2}, Lorg/ietf/jgss/GSSException;->getMajor()I

    move-result v9

    const/16 v10, 0xd

    if-ne v9, v10, :cond_7

    .line 166
    new-instance v9, Ljava/lang/Exception;

    invoke-virtual {v2}, Lorg/ietf/jgss/GSSException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 167
    :cond_7
    invoke-virtual {v2}, Lorg/ietf/jgss/GSSException;->getMajor()I

    move-result v9

    const/16 v10, 0xa

    if-eq v9, v10, :cond_8

    invoke-virtual {v2}, Lorg/ietf/jgss/GSSException;->getMajor()I

    move-result v9

    const/16 v10, 0x13

    if-eq v9, v10, :cond_8

    invoke-virtual {v2}, Lorg/ietf/jgss/GSSException;->getMajor()I

    move-result v9

    const/16 v10, 0x14

    if-ne v9, v10, :cond_9

    .line 170
    :cond_8
    new-instance v9, Ljava/lang/Exception;

    invoke-virtual {v2}, Lorg/ietf/jgss/GSSException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 172
    :cond_9
    new-instance v9, Ljava/lang/Exception;

    invoke-virtual {v2}, Lorg/ietf/jgss/GSSException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v9
.end method
