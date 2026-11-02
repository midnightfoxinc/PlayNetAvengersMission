.class public Lcom/ning/http/client/ProxyServer;
.super Ljava/lang/Object;
.source "ProxyServer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/ProxyServer$Protocol;
    }
.end annotation


# instance fields
.field private charset:Ljava/nio/charset/Charset;

.field private final host:Ljava/lang/String;

.field private final nonProxyHosts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private ntlmDomain:Ljava/lang/String;

.field private ntlmHost:Ljava/lang/String;

.field private final password:Ljava/lang/String;

.field private final port:I

.field private final principal:Ljava/lang/String;

.field private final protocol:Lcom/ning/http/client/ProxyServer$Protocol;

.field private scheme:Lcom/ning/http/client/Realm$AuthScheme;

.field private final url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/ning/http/client/ProxyServer$Protocol;Ljava/lang/String;I)V
    .locals 6
    .param p1, "protocol"    # Lcom/ning/http/client/ProxyServer$Protocol;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I

    .prologue
    const/4 v4, 0x0

    .line 78
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/ProxyServer;-><init>(Lcom/ning/http/client/ProxyServer$Protocol;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 79
    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/ProxyServer$Protocol;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "protocol"    # Lcom/ning/http/client/ProxyServer$Protocol;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "principal"    # Ljava/lang/String;
    .param p5, "password"    # Ljava/lang/String;

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/ProxyServer;->nonProxyHosts:Ljava/util/List;

    .line 59
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    iput-object v0, p0, Lcom/ning/http/client/ProxyServer;->charset:Ljava/nio/charset/Charset;

    .line 60
    const-string v0, "http.auth.ntlm.domain"

    const-string v1, ""

    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/ProxyServer;->ntlmDomain:Ljava/lang/String;

    .line 62
    sget-object v0, Lcom/ning/http/client/Realm$AuthScheme;->BASIC:Lcom/ning/http/client/Realm$AuthScheme;

    iput-object v0, p0, Lcom/ning/http/client/ProxyServer;->scheme:Lcom/ning/http/client/Realm$AuthScheme;

    .line 65
    iput-object p1, p0, Lcom/ning/http/client/ProxyServer;->protocol:Lcom/ning/http/client/ProxyServer$Protocol;

    .line 66
    iput-object p2, p0, Lcom/ning/http/client/ProxyServer;->host:Ljava/lang/String;

    .line 67
    iput p3, p0, Lcom/ning/http/client/ProxyServer;->port:I

    .line 68
    iput-object p4, p0, Lcom/ning/http/client/ProxyServer;->principal:Ljava/lang/String;

    .line 69
    iput-object p5, p0, Lcom/ning/http/client/ProxyServer;->password:Ljava/lang/String;

    .line 70
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/ProxyServer;->url:Ljava/lang/String;

    .line 71
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 6
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    const/4 v4, 0x0

    .line 82
    sget-object v1, Lcom/ning/http/client/ProxyServer$Protocol;->HTTP:Lcom/ning/http/client/ProxyServer$Protocol;

    move-object v0, p0

    move-object v2, p1

    move v3, p2

    move-object v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/ProxyServer;-><init>(Lcom/ning/http/client/ProxyServer$Protocol;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 83
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "principal"    # Ljava/lang/String;
    .param p4, "password"    # Ljava/lang/String;

    .prologue
    .line 74
    sget-object v1, Lcom/ning/http/client/ProxyServer$Protocol;->HTTP:Lcom/ning/http/client/ProxyServer$Protocol;

    move-object v0, p0

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/ProxyServer;-><init>(Lcom/ning/http/client/ProxyServer$Protocol;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 75
    return-void
.end method


# virtual methods
.method public addNonProxyHost(Ljava/lang/String;)Lcom/ning/http/client/ProxyServer;
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 125
    iget-object v0, p0, Lcom/ning/http/client/ProxyServer;->nonProxyHosts:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 126
    return-object p0
.end method

.method public getCharset()Ljava/nio/charset/Charset;
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lcom/ning/http/client/ProxyServer;->charset:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lcom/ning/http/client/ProxyServer;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getNonProxyHosts()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 135
    iget-object v0, p0, Lcom/ning/http/client/ProxyServer;->nonProxyHosts:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getNtlmDomain()Ljava/lang/String;
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lcom/ning/http/client/ProxyServer;->ntlmDomain:Ljava/lang/String;

    return-object v0
.end method

.method public getNtlmHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 156
    iget-object v0, p0, Lcom/ning/http/client/ProxyServer;->ntlmHost:Ljava/lang/String;

    return-object v0
.end method

.method public getPassword()Ljava/lang/String;
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Lcom/ning/http/client/ProxyServer;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 104
    iget v0, p0, Lcom/ning/http/client/ProxyServer;->port:I

    return v0
.end method

.method public getPrincipal()Ljava/lang/String;
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lcom/ning/http/client/ProxyServer;->principal:Ljava/lang/String;

    return-object v0
.end method

.method public getProtocol()Lcom/ning/http/client/ProxyServer$Protocol;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lcom/ning/http/client/ProxyServer;->protocol:Lcom/ning/http/client/ProxyServer$Protocol;

    return-object v0
.end method

.method public getScheme()Lcom/ning/http/client/Realm$AuthScheme;
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lcom/ning/http/client/ProxyServer;->scheme:Lcom/ning/http/client/Realm$AuthScheme;

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 164
    iget-object v0, p0, Lcom/ning/http/client/ProxyServer;->url:Ljava/lang/String;

    return-object v0
.end method

.method public realmBuilder()Lcom/ning/http/client/Realm$RealmBuilder;
    .locals 2

    .prologue
    .line 86
    new-instance v0, Lcom/ning/http/client/Realm$RealmBuilder;

    invoke-direct {v0}, Lcom/ning/http/client/Realm$RealmBuilder;-><init>()V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/ning/http/client/Realm$RealmBuilder;->setTargetProxy(Z)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/ProxyServer;->ntlmDomain:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/ning/http/client/Realm$RealmBuilder;->setNtlmDomain(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/ProxyServer;->ntlmHost:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/ning/http/client/Realm$RealmBuilder;->setNtlmHost(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/ProxyServer;->principal:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/ning/http/client/Realm$RealmBuilder;->setPrincipal(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/ProxyServer;->password:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/ning/http/client/Realm$RealmBuilder;->setPassword(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/ProxyServer;->scheme:Lcom/ning/http/client/Realm$AuthScheme;

    invoke-virtual {v0, v1}, Lcom/ning/http/client/Realm$RealmBuilder;->setScheme(Lcom/ning/http/client/Realm$AuthScheme;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v0

    return-object v0
.end method

.method public removeNonProxyHost(Ljava/lang/String;)Lcom/ning/http/client/ProxyServer;
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/ning/http/client/ProxyServer;->nonProxyHosts:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 131
    return-object p0
.end method

.method public setCharset(Ljava/nio/charset/Charset;)Lcom/ning/http/client/ProxyServer;
    .locals 0
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 116
    iput-object p1, p0, Lcom/ning/http/client/ProxyServer;->charset:Ljava/nio/charset/Charset;

    .line 117
    return-object p0
.end method

.method public setNtlmDomain(Ljava/lang/String;)Lcom/ning/http/client/ProxyServer;
    .locals 0
    .param p1, "ntlmDomain"    # Ljava/lang/String;

    .prologue
    .line 139
    iput-object p1, p0, Lcom/ning/http/client/ProxyServer;->ntlmDomain:Ljava/lang/String;

    .line 140
    return-object p0
.end method

.method public setNtlmHost(Ljava/lang/String;)V
    .locals 0
    .param p1, "ntlmHost"    # Ljava/lang/String;

    .prologue
    .line 160
    iput-object p1, p0, Lcom/ning/http/client/ProxyServer;->ntlmHost:Ljava/lang/String;

    .line 161
    return-void
.end method

.method public setScheme(Lcom/ning/http/client/Realm$AuthScheme;)V
    .locals 0
    .param p1, "scheme"    # Lcom/ning/http/client/Realm$AuthScheme;

    .prologue
    .line 152
    iput-object p1, p0, Lcom/ning/http/client/ProxyServer;->scheme:Lcom/ning/http/client/Realm$AuthScheme;

    .line 153
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 169
    iget-object v0, p0, Lcom/ning/http/client/ProxyServer;->url:Ljava/lang/String;

    return-object v0
.end method
