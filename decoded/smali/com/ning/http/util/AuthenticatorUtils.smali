.class public final Lcom/ning/http/util/AuthenticatorUtils;
.super Ljava/lang/Object;
.source "AuthenticatorUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static append(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/StringBuilder;
    .locals 3
    .param p0, "builder"    # Ljava/lang/StringBuilder;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "quoted"    # Z

    .prologue
    const/16 v2, 0x22

    .line 72
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 73
    if-eqz p3, :cond_0

    .line 74
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 78
    :goto_0
    const-string v0, ", "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0

    .line 76
    :cond_0
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method public static computeBasicAuthentication(Lcom/ning/http/client/ProxyServer;)Ljava/lang/String;
    .locals 3
    .param p0, "proxyServer"    # Lcom/ning/http/client/ProxyServer;

    .prologue
    .line 32
    invoke-virtual {p0}, Lcom/ning/http/client/ProxyServer;->getPrincipal()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/ning/http/client/ProxyServer;->getPassword()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/ning/http/client/ProxyServer;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/ning/http/util/AuthenticatorUtils;->computeBasicAuthentication(Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static computeBasicAuthentication(Lcom/ning/http/client/Realm;)Ljava/lang/String;
    .locals 3
    .param p0, "realm"    # Lcom/ning/http/client/Realm;

    .prologue
    .line 28
    invoke-virtual {p0}, Lcom/ning/http/client/Realm;->getPrincipal()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/ning/http/client/Realm;->getPassword()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/ning/http/client/Realm;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/ning/http/util/AuthenticatorUtils;->computeBasicAuthentication(Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static computeBasicAuthentication(Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 3
    .param p0, "principal"    # Ljava/lang/String;
    .param p1, "password"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 36
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 37
    .local v0, "s":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Basic "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    invoke-static {v2}, Lcom/ning/http/util/Base64;->encode([B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static computeDigestAuthentication(Lcom/ning/http/client/Realm;)Ljava/lang/String;
    .locals 5
    .param p0, "realm"    # Lcom/ning/http/client/Realm;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 52
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Digest "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 53
    .local v0, "builder":Ljava/lang/StringBuilder;
    const-string v1, "username"

    invoke-virtual {p0}, Lcom/ning/http/client/Realm;->getPrincipal()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2, v3}, Lcom/ning/http/util/AuthenticatorUtils;->append(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/StringBuilder;

    .line 54
    const-string v1, "realm"

    invoke-virtual {p0}, Lcom/ning/http/client/Realm;->getRealmName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2, v3}, Lcom/ning/http/util/AuthenticatorUtils;->append(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/StringBuilder;

    .line 55
    const-string v1, "nonce"

    invoke-virtual {p0}, Lcom/ning/http/client/Realm;->getNonce()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2, v3}, Lcom/ning/http/util/AuthenticatorUtils;->append(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/StringBuilder;

    .line 56
    const-string v1, "uri"

    invoke-static {p0}, Lcom/ning/http/util/AuthenticatorUtils;->computeRealmURI(Lcom/ning/http/client/Realm;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2, v3}, Lcom/ning/http/util/AuthenticatorUtils;->append(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/StringBuilder;

    .line 57
    const-string v1, "algorithm"

    invoke-virtual {p0}, Lcom/ning/http/client/Realm;->getAlgorithm()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2, v4}, Lcom/ning/http/util/AuthenticatorUtils;->append(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/StringBuilder;

    .line 59
    const-string v1, "response"

    invoke-virtual {p0}, Lcom/ning/http/client/Realm;->getResponse()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2, v3}, Lcom/ning/http/util/AuthenticatorUtils;->append(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/StringBuilder;

    .line 60
    invoke-virtual {p0}, Lcom/ning/http/client/Realm;->getOpaque()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 61
    const-string v1, "opaque"

    invoke-virtual {p0}, Lcom/ning/http/client/Realm;->getOpaque()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2, v3}, Lcom/ning/http/util/AuthenticatorUtils;->append(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/StringBuilder;

    .line 62
    :cond_0
    const-string v1, "qop"

    invoke-virtual {p0}, Lcom/ning/http/client/Realm;->getQop()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2, v4}, Lcom/ning/http/util/AuthenticatorUtils;->append(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/StringBuilder;

    .line 63
    const-string v1, "nc"

    invoke-virtual {p0}, Lcom/ning/http/client/Realm;->getNc()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2, v4}, Lcom/ning/http/util/AuthenticatorUtils;->append(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/StringBuilder;

    .line 64
    const-string v1, "cnonce"

    invoke-virtual {p0}, Lcom/ning/http/client/Realm;->getCnonce()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2, v3}, Lcom/ning/http/util/AuthenticatorUtils;->append(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/StringBuilder;

    .line 65
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 68
    new-instance v1, Ljava/lang/String;

    sget-object v2, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-static {v0, v2}, Lcom/ning/http/util/StringUtils;->charSequence2Bytes(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    return-object v1
.end method

.method private static computeRealmURI(Lcom/ning/http/client/Realm;)Ljava/lang/String;
    .locals 4
    .param p0, "realm"    # Lcom/ning/http/client/Realm;

    .prologue
    .line 41
    invoke-virtual {p0}, Lcom/ning/http/client/Realm;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v1

    .line 42
    .local v1, "uri":Lcom/ning/http/client/uri/Uri;
    invoke-virtual {p0}, Lcom/ning/http/client/Realm;->isUseAbsoluteURI()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 43
    invoke-virtual {p0}, Lcom/ning/http/client/Realm;->isOmitQuery()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Lcom/ning/http/client/uri/Uri;->getQuery()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/ning/http/client/uri/Uri;->withNewQuery(Ljava/lang/String;)Lcom/ning/http/client/uri/Uri;

    move-result-object v2

    invoke-virtual {v2}, Lcom/ning/http/client/uri/Uri;->toUrl()Ljava/lang/String;

    move-result-object v2

    .line 46
    :goto_0
    return-object v2

    .line 43
    :cond_0
    invoke-virtual {v1}, Lcom/ning/http/client/uri/Uri;->toUrl()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 45
    :cond_1
    invoke-static {v1}, Lcom/ning/http/util/AsyncHttpProviderUtils;->getNonEmptyPath(Lcom/ning/http/client/uri/Uri;)Ljava/lang/String;

    move-result-object v0

    .line 46
    .local v0, "path":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/ning/http/client/Realm;->isOmitQuery()Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {v1}, Lcom/ning/http/client/uri/Uri;->getQuery()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    .end local v0    # "path":Ljava/lang/String;
    :cond_2
    :goto_1
    move-object v2, v0

    goto :goto_0

    .restart local v0    # "path":Ljava/lang/String;
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "?"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Lcom/ning/http/client/uri/Uri;->getQuery()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method
