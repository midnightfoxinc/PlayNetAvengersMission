.class public Lcom/disneymobile/network/DMOBackendConnection;
.super Lcom/disneymobile/mocha/NSObject;
.source "DMOBackendConnection.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disneymobile/network/DMOBackendConnection$Analytics;
    }
.end annotation


# static fields
.field private static gSharedBackend:Lcom/disneymobile/network/DMOBackendConnection;


# instance fields
.field private final analytics:Lcom/disneymobile/network/DMOBackendConnection$Analytics;

.field private apiURL:Lcom/disneymobile/mocha/NSURL;

.field private appKey:Ljava/lang/String;

.field private appSecret:Ljava/lang/String;

.field private authenticatedAvatar:Ljava/lang/String;

.field private authenticatedEmailAddress:Ljava/lang/String;

.field private authenticatedID:Ljava/lang/String;

.field private authenticatedUsername:Ljava/lang/String;

.field private bundleId:Ljava/lang/String;

.field private clientIdentifier:Ljava/lang/String;

.field private sessionID:Ljava/lang/String;

.field private sysInfo:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private tokenInfo:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSObject;-><init>()V

    .line 311
    new-instance v0, Lcom/disneymobile/network/DMOBackendConnection$Analytics;

    invoke-direct {v0, p0}, Lcom/disneymobile/network/DMOBackendConnection$Analytics;-><init>(Lcom/disneymobile/network/DMOBackendConnection;)V

    iput-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->analytics:Lcom/disneymobile/network/DMOBackendConnection$Analytics;

    .line 313
    return-void
.end method

.method private static CCHmac(Lcom/disneymobile/mocha/NSData;Lcom/disneymobile/mocha/NSData;)[B
    .locals 7
    .param p0, "key"    # Lcom/disneymobile/mocha/NSData;
    .param p1, "data"    # Lcom/disneymobile/mocha/NSData;

    .prologue
    .line 170
    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSData;->length()I

    move-result v5

    new-array v2, v5, [B

    .line 171
    .local v2, "keyBytes":[B
    array-length v5, v2

    invoke-virtual {p0, v2, v5}, Lcom/disneymobile/mocha/NSData;->getBytesLength([BI)Lcom/disneymobile/mocha/NSError;

    .line 172
    new-instance v4, Ljavax/crypto/spec/SecretKeySpec;

    const-string v5, "HmacSHA1"

    invoke-direct {v4, v2, v5}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 176
    .local v4, "signingKey":Ljavax/crypto/spec/SecretKeySpec;
    :try_start_0
    const-string v5, "HmacSHA1"

    invoke-static {v5}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v3

    .line 177
    .local v3, "mac":Ljavax/crypto/Mac;
    invoke-virtual {v3, v4}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 178
    invoke-virtual {p1}, Lcom/disneymobile/mocha/NSData;->length()I

    move-result v5

    new-array v0, v5, [B

    .line 179
    .local v0, "dataBytes":[B
    array-length v5, v0

    invoke-virtual {p1, v0, v5}, Lcom/disneymobile/mocha/NSData;->getBytesLength([BI)Lcom/disneymobile/mocha/NSError;

    .line 180
    invoke-virtual {v3, v0}, Ljavax/crypto/Mac;->doFinal([B)[B
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v5

    return-object v5

    .line 181
    .end local v0    # "dataBytes":[B
    .end local v3    # "mac":Ljavax/crypto/Mac;
    :catch_0
    move-exception v1

    .line 182
    .local v1, "e":Ljava/security/InvalidKeyException;
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "Invalid key"

    invoke-direct {v5, v6, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 183
    .end local v1    # "e":Ljava/security/InvalidKeyException;
    :catch_1
    move-exception v1

    .line 184
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "Unsupported encryption algorithm"

    invoke-direct {v5, v6, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
.end method

.method private _signatureFromArgumentsAndHttpMethod(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;
    .locals 17
    .param p2, "httpMethod"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 133
    .local p1, "arguments":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual/range {p1 .. p1}, Ljava/util/HashMap;->size()I

    move-result v13

    new-array v7, v13, [Ljava/lang/String;

    .line 134
    .local v7, "queryPairs":[Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v13

    new-instance v14, Lcom/disneymobile/mocha/support/Selector;

    const-string v15, "compareTo"

    invoke-direct {v14, v15}, Lcom/disneymobile/mocha/support/Selector;-><init>(Ljava/lang/String;)V

    invoke-static {v13, v14}, Lcom/disneymobile/mocha/Utilities;->sortedArrayUsingSelector(Ljava/util/Set;Lcom/disneymobile/mocha/support/Selector;)[Ljava/lang/String;

    move-result-object v6

    .line 135
    .local v6, "queryKeys":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v13, v6

    if-ge v3, v13, :cond_1

    .line 136
    aget-object v5, v7, v3

    .line 137
    .local v5, "queryKey":Ljava/lang/String;
    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 138
    .local v8, "queryValue":Ljava/lang/Object;
    instance-of v13, v8, Lcom/disneymobile/mocha/NSData;

    if-eqz v13, :cond_0

    .line 135
    .end local v8    # "queryValue":Ljava/lang/Object;
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 139
    .restart local v8    # "queryValue":Ljava/lang/Object;
    :cond_0
    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13

    const-string v14, " "

    const-string v15, "+"

    invoke-virtual {v13, v14, v15}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    .line 143
    .local v8, "queryValue":Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v7, v3

    goto :goto_1

    .line 148
    .end local v5    # "queryKey":Ljava/lang/String;
    .end local v8    # "queryValue":Ljava/lang/String;
    :cond_1
    const-string v13, "%@&%@&%@"

    const/4 v14, 0x3

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    aput-object p2, v14, v15

    const/4 v15, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disneymobile/network/DMOBackendConnection;->apiURL:Lcom/disneymobile/mocha/NSURL;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/disneymobile/mocha/NSURL;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x2

    const-string v16, "&"

    move-object/from16 v0, v16

    invoke-static {v7, v0}, Lcom/disneymobile/mocha/Utilities;->concatString([Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Lcom/disneymobile/mocha/Utilities;->stringWithFormat(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 150
    .local v9, "rawHash":Ljava/lang/String;
    const-string v13, "%@&"

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disneymobile/network/DMOBackendConnection;->appSecret:Ljava/lang/String;

    move-object/from16 v16, v0

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Lcom/disneymobile/mocha/Utilities;->stringWithFormat(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 156
    .local v4, "keyStr":Ljava/lang/String;
    const/4 v13, 0x0

    invoke-static {v4, v13}, Lcom/disneymobile/mocha/Utilities;->dataUsingEncoding(Ljava/lang/String;I)Lcom/disneymobile/mocha/NSData;

    move-result-object v12

    .line 157
    .local v12, "secretData":Lcom/disneymobile/mocha/NSData;
    const/4 v13, 0x0

    invoke-static {v9, v13}, Lcom/disneymobile/mocha/Utilities;->dataUsingEncoding(Ljava/lang/String;I)Lcom/disneymobile/mocha/NSData;

    move-result-object v2

    .line 158
    .local v2, "clearTextData":Lcom/disneymobile/mocha/NSData;
    invoke-static {v12, v2}, Lcom/disneymobile/network/DMOBackendConnection;->CCHmac(Lcom/disneymobile/mocha/NSData;Lcom/disneymobile/mocha/NSData;)[B

    move-result-object v10

    .line 160
    .local v10, "result":[B
    invoke-static {v10}, Lcom/disneymobile/mocha/NSData;->dataWithBytesNoCopy([B)Lcom/disneymobile/mocha/NSData;

    move-result-object v11

    .line 161
    .local v11, "resultData":Lcom/disneymobile/mocha/NSData;
    invoke-virtual {v11}, Lcom/disneymobile/mocha/NSData;->base64Encoding()Ljava/lang/String;

    move-result-object v1

    .line 165
    .local v1, "base64EncodedResult":Ljava/lang/String;
    invoke-static {v1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    return-object v13
.end method

.method static synthetic access$000(Lcom/disneymobile/network/DMOBackendConnection;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/disneymobile/network/DMOBackendConnection;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->appKey:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/disneymobile/network/DMOBackendConnection;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/disneymobile/network/DMOBackendConnection;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->appSecret:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/disneymobile/mocha/NSData;Lcom/disneymobile/mocha/NSData;)[B
    .locals 1
    .param p0, "x0"    # Lcom/disneymobile/mocha/NSData;
    .param p1, "x1"    # Lcom/disneymobile/mocha/NSData;

    .prologue
    .line 23
    invoke-static {p0, p1}, Lcom/disneymobile/network/DMOBackendConnection;->CCHmac(Lcom/disneymobile/mocha/NSData;Lcom/disneymobile/mocha/NSData;)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/disneymobile/network/DMOBackendConnection;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/disneymobile/network/DMOBackendConnection;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->clientIdentifier:Ljava/lang/String;

    return-object v0
.end method

.method private addCommentToEntityIdForAppAndType(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lcom/disneymobile/network/DMOBackendResponse;
    .locals 3
    .param p1, "comment"    # Ljava/lang/String;
    .param p2, "entityId"    # Ljava/lang/String;
    .param p3, "app"    # Ljava/lang/String;
    .param p4, "type"    # I

    .prologue
    .line 298
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 299
    .local v0, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "comment"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 300
    const-string v1, "app"

    invoke-virtual {v0, v1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 301
    const-string v1, "entity_id"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    const-string v1, "type"

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    const-string v1, "tapulous_comments_add"

    invoke-virtual {p0, v1, v0}, Lcom/disneymobile/network/DMOBackendConnection;->_callRemoteMethodWithParameters(Ljava/lang/String;Ljava/util/HashMap;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v1

    return-object v1
.end method

.method private createUsernamePasswordEmailAndAvatar(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/disneymobile/network/DMOBackendResponse;
    .locals 3
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "pass"    # Ljava/lang/String;
    .param p3, "email"    # Ljava/lang/String;
    .param p4, "photo"    # Ljava/lang/String;

    .prologue
    .line 277
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 278
    .local v0, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "username"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 279
    const-string v1, "password"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 280
    const-string v1, "email"

    invoke-virtual {v0, v1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 281
    const-string v1, "avatar"

    if-eqz p4, :cond_0

    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    .end local p4    # "photo":Ljava/lang/String;
    :goto_0
    invoke-virtual {v0, v1, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 282
    const-string v1, "tapulous.auth.create"

    invoke-virtual {p0, v1, v0}, Lcom/disneymobile/network/DMOBackendConnection;->_callRemoteMethodWithParameters(Ljava/lang/String;Ljava/util/HashMap;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v1

    return-object v1

    .line 281
    .restart local p4    # "photo":Ljava/lang/String;
    :cond_0
    const-string p4, ""

    goto :goto_0
.end method

.method private getCommentsForAppEntityIdAndType(Ljava/lang/String;Ljava/lang/String;I)Lcom/disneymobile/network/DMOBackendResponse;
    .locals 3
    .param p1, "app"    # Ljava/lang/String;
    .param p2, "entityId"    # Ljava/lang/String;
    .param p3, "type"    # I

    .prologue
    .line 287
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 288
    .local v0, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "app"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    const-string v1, "type"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    const-string v1, "entity_id"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    const-string v1, "page"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    const-string v1, "per_page"

    const/16 v2, 0x14

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    const-string v1, "tapulous_comments_get"

    invoke-virtual {p0, v1, v0}, Lcom/disneymobile/network/DMOBackendConnection;->_callRemoteMethodWithParameters(Ljava/lang/String;Ljava/util/HashMap;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v1

    return-object v1
.end method

.method protected static getUnixTimestamp()Ljava/lang/String;
    .locals 4

    .prologue
    .line 308
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private loginUsernameAndPassword(Ljava/lang/String;Ljava/lang/String;)Lcom/disneymobile/network/DMOBackendResponse;
    .locals 2
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "pass"    # Ljava/lang/String;

    .prologue
    .line 263
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 264
    .local v0, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "username"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    const-string v1, "password"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    const-string v1, "tapulous.auth.login"

    invoke-virtual {p0, v1, v0}, Lcom/disneymobile/network/DMOBackendConnection;->_callRemoteMethodWithParameters(Ljava/lang/String;Ljava/util/HashMap;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v1

    return-object v1
.end method

.method private logout()Lcom/disneymobile/network/DMOBackendResponse;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 271
    iput-object v1, p0, Lcom/disneymobile/network/DMOBackendConnection;->authenticatedUsername:Ljava/lang/String;

    iput-object v1, p0, Lcom/disneymobile/network/DMOBackendConnection;->authenticatedID:Ljava/lang/String;

    .line 272
    const-string v0, "tapulous.auth.logout"

    invoke-virtual {p0, v0, v1}, Lcom/disneymobile/network/DMOBackendConnection;->_callRemoteMethodWithParameters(Ljava/lang/String;Ljava/util/HashMap;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v0

    return-object v0
.end method

.method public static setSharedBackendConnection(Lcom/disneymobile/network/DMOBackendConnection;)V
    .locals 2
    .param p0, "sharedBackend"    # Lcom/disneymobile/network/DMOBackendConnection;

    .prologue
    .line 108
    sget-object v0, Lcom/disneymobile/network/DMOBackendConnection;->gSharedBackend:Lcom/disneymobile/network/DMOBackendConnection;

    if-eqz v0, :cond_0

    .line 109
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "DMOBackendConnection already initialized."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 111
    :cond_0
    sput-object p0, Lcom/disneymobile/network/DMOBackendConnection;->gSharedBackend:Lcom/disneymobile/network/DMOBackendConnection;

    .line 112
    return-void
.end method

.method public static sharedBackendConnection()Lcom/disneymobile/network/DMOBackendConnection;
    .locals 2

    .prologue
    .line 101
    sget-object v0, Lcom/disneymobile/network/DMOBackendConnection;->gSharedBackend:Lcom/disneymobile/network/DMOBackendConnection;

    if-nez v0, :cond_0

    .line 102
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "DMOBackendConnection not initialized."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 104
    :cond_0
    sget-object v0, Lcom/disneymobile/network/DMOBackendConnection;->gSharedBackend:Lcom/disneymobile/network/DMOBackendConnection;

    return-object v0
.end method


# virtual methods
.method public URL()Lcom/disneymobile/mocha/NSURL;
    .locals 1

    .prologue
    .line 253
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->apiURL:Lcom/disneymobile/mocha/NSURL;

    return-object v0
.end method

.method public _callRemoteMethodWithParameters(Ljava/lang/String;Ljava/util/HashMap;)Lcom/disneymobile/network/DMOBackendResponse;
    .locals 4
    .param p1, "method"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/disneymobile/network/DMOBackendResponse;"
        }
    .end annotation

    .prologue
    .line 190
    .local p2, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 193
    .local v0, "p":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "method"

    invoke-virtual {v0, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    const-string v2, "format"

    const-string v3, "plist"

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    const-string v2, "api_key"

    iget-object v3, p0, Lcom/disneymobile/network/DMOBackendConnection;->appKey:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    const-string v2, "session_hash"

    iget-object v3, p0, Lcom/disneymobile/network/DMOBackendConnection;->sessionID:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    const-string v2, "timestamp"

    invoke-static {}, Lcom/disneymobile/network/DMOBackendConnection;->getUnixTimestamp()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    iget-object v2, p0, Lcom/disneymobile/network/DMOBackendConnection;->clientIdentifier:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/disneymobile/network/DMOBackendConnection;->clientIdentifier:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 206
    const-string v2, "client_id"

    iget-object v3, p0, Lcom/disneymobile/network/DMOBackendConnection;->clientIdentifier:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    :cond_0
    const-string v2, "POST"

    invoke-direct {p0, v0, v2}, Lcom/disneymobile/network/DMOBackendConnection;->_signatureFromArgumentsAndHttpMethod(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 216
    .local v1, "requestSignature":Ljava/lang/String;
    const-string v2, "api_sig"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    new-instance v2, Lcom/disneymobile/network/DMOBackendResponse;

    invoke-direct {v2}, Lcom/disneymobile/network/DMOBackendResponse;-><init>()V

    invoke-virtual {v2, p0, v0}, Lcom/disneymobile/network/DMOBackendResponse;->initWithConnectionAndPOSTDictionary(Lcom/disneymobile/network/DMOBackendConnection;Ljava/util/HashMap;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v2

    return-object v2
.end method

.method _processStandardResponseFields(Ljava/util/HashMap;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 225
    .local p1, "response":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "authenticated"

    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 226
    .local v0, "authenticated":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_0

    .line 227
    iput-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->authenticatedUsername:Ljava/lang/String;

    .line 230
    :cond_0
    const-string v4, "authenticated_id"

    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 231
    .local v3, "authenticated_id":Ljava/lang/String;
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_1

    .line 232
    iput-object v3, p0, Lcom/disneymobile/network/DMOBackendConnection;->authenticatedID:Ljava/lang/String;

    .line 235
    :cond_1
    const-string v4, "authenticated_email"

    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 236
    .local v2, "authenticated_email":Ljava/lang/String;
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_2

    .line 237
    iput-object v2, p0, Lcom/disneymobile/network/DMOBackendConnection;->authenticatedEmailAddress:Ljava/lang/String;

    .line 240
    :cond_2
    const-string v4, "authenticated_avatar"

    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 241
    .local v1, "authenticated_avatar":Ljava/lang/String;
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_3

    .line 242
    iput-object v1, p0, Lcom/disneymobile/network/DMOBackendConnection;->authenticatedAvatar:Ljava/lang/String;

    .line 244
    :cond_3
    return-void
.end method

.method public analytics()Lcom/disneymobile/network/DMOBackendConnection$Analytics;
    .locals 1

    .prologue
    .line 312
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->analytics:Lcom/disneymobile/network/DMOBackendConnection$Analytics;

    return-object v0
.end method

.method public appKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->appKey:Ljava/lang/String;

    return-object v0
.end method

.method public appSecret()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->appSecret:Ljava/lang/String;

    return-object v0
.end method

.method public authenticated()Z
    .locals 1

    .prologue
    .line 258
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->authenticatedUsername:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->authenticatedUsername:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public authenticatedAvatarURL()Lcom/disneymobile/mocha/NSURL;
    .locals 1

    .prologue
    .line 248
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->authenticatedAvatar:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->authenticatedAvatar:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->authenticatedAvatar:Ljava/lang/String;

    invoke-static {v0}, Lcom/disneymobile/mocha/NSURL;->URLWithString(Ljava/lang/String;)Lcom/disneymobile/mocha/NSURL;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public authenticatedEmailAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->authenticatedEmailAddress:Ljava/lang/String;

    return-object v0
.end method

.method public authenticatedID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->authenticatedID:Ljava/lang/String;

    return-object v0
.end method

.method public authenticatedUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->authenticatedUsername:Ljava/lang/String;

    return-object v0
.end method

.method public clientIdentifier()Ljava/lang/String;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->clientIdentifier:Ljava/lang/String;

    return-object v0
.end method

.method public initWithURLKeyAndSecret(Lcom/disneymobile/mocha/NSURL;Ljava/lang/String;Ljava/lang/String;)Lcom/disneymobile/network/DMOBackendConnection;
    .locals 2
    .param p1, "url"    # Lcom/disneymobile/mocha/NSURL;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "secret"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 115
    iput-object p1, p0, Lcom/disneymobile/network/DMOBackendConnection;->apiURL:Lcom/disneymobile/mocha/NSURL;

    .line 116
    iput-object p2, p0, Lcom/disneymobile/network/DMOBackendConnection;->appKey:Ljava/lang/String;

    .line 117
    iput-object p3, p0, Lcom/disneymobile/network/DMOBackendConnection;->appSecret:Ljava/lang/String;

    .line 118
    iput-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->authenticatedUsername:Ljava/lang/String;

    .line 119
    iput-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->authenticatedID:Ljava/lang/String;

    .line 121
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalytics;->getSysInfo()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->sysInfo:Ljava/util/Map;

    .line 124
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->sysInfo:Ljava/util/Map;

    const-string v1, "session_hash"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->sessionID:Ljava/lang/String;

    .line 126
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->sysInfo:Ljava/util/Map;

    const-string v1, "bundle_id"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->bundleId:Ljava/lang/String;

    .line 128
    return-object p0
.end method

.method public sessionID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendConnection;->sessionID:Ljava/lang/String;

    return-object v0
.end method

.method public setAppKey(Ljava/lang/String;)V
    .locals 0
    .param p1, "appKey"    # Ljava/lang/String;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/disneymobile/network/DMOBackendConnection;->appKey:Ljava/lang/String;

    .line 50
    return-void
.end method

.method public setAppSecret(Ljava/lang/String;)V
    .locals 0
    .param p1, "appSecret"    # Ljava/lang/String;

    .prologue
    .line 57
    iput-object p1, p0, Lcom/disneymobile/network/DMOBackendConnection;->appSecret:Ljava/lang/String;

    .line 58
    return-void
.end method

.method public setAuthenticatedEmailAddress(Ljava/lang/String;)V
    .locals 0
    .param p1, "authenticatedEmailAddress"    # Ljava/lang/String;

    .prologue
    .line 73
    iput-object p1, p0, Lcom/disneymobile/network/DMOBackendConnection;->authenticatedEmailAddress:Ljava/lang/String;

    .line 74
    return-void
.end method

.method public setAuthenticatedID(Ljava/lang/String;)V
    .locals 0
    .param p1, "authenticatedID"    # Ljava/lang/String;

    .prologue
    .line 81
    iput-object p1, p0, Lcom/disneymobile/network/DMOBackendConnection;->authenticatedID:Ljava/lang/String;

    .line 82
    return-void
.end method

.method public setAuthenticatedUsername(Ljava/lang/String;)V
    .locals 0
    .param p1, "authenticatedUsername"    # Ljava/lang/String;

    .prologue
    .line 65
    iput-object p1, p0, Lcom/disneymobile/network/DMOBackendConnection;->authenticatedUsername:Ljava/lang/String;

    .line 66
    return-void
.end method

.method public setClientIdentifier(Ljava/lang/String;)V
    .locals 0
    .param p1, "clientIdentifier"    # Ljava/lang/String;

    .prologue
    .line 89
    iput-object p1, p0, Lcom/disneymobile/network/DMOBackendConnection;->clientIdentifier:Ljava/lang/String;

    .line 90
    return-void
.end method

.method public setSessionID(Ljava/lang/String;)V
    .locals 0
    .param p1, "sessionID"    # Ljava/lang/String;

    .prologue
    .line 97
    iput-object p1, p0, Lcom/disneymobile/network/DMOBackendConnection;->sessionID:Ljava/lang/String;

    .line 98
    return-void
.end method
