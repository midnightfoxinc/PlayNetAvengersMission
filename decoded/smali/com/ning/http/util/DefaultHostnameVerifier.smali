.class public Lcom/ning/http/util/DefaultHostnameVerifier;
.super Ljava/lang/Object;
.source "DefaultHostnameVerifier.java"

# interfaces
.implements Ljavax/net/ssl/HostnameVerifier;


# static fields
.field private static final log:Lorg/slf4j/Logger;


# instance fields
.field private checker:Lcom/ning/http/util/HostnameChecker;

.field private extraHostnameVerifier:Ljavax/net/ssl/HostnameVerifier;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    const-class v0, Lcom/ning/http/util/DefaultHostnameVerifier;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/String;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/util/DefaultHostnameVerifier;->log:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Lcom/ning/http/util/ProxyHostnameChecker;

    invoke-direct {v0}, Lcom/ning/http/util/ProxyHostnameChecker;-><init>()V

    iput-object v0, p0, Lcom/ning/http/util/DefaultHostnameVerifier;->checker:Lcom/ning/http/util/HostnameChecker;

    .line 48
    return-void
.end method

.method public constructor <init>(Lcom/ning/http/util/HostnameChecker;)V
    .locals 0
    .param p1, "checker"    # Lcom/ning/http/util/HostnameChecker;

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object p1, p0, Lcom/ning/http/util/DefaultHostnameVerifier;->checker:Lcom/ning/http/util/HostnameChecker;

    .line 57
    return-void
.end method

.method public constructor <init>(Lcom/ning/http/util/HostnameChecker;Ljavax/net/ssl/HostnameVerifier;)V
    .locals 0
    .param p1, "checker"    # Lcom/ning/http/util/HostnameChecker;
    .param p2, "extraHostnameVerifier"    # Ljavax/net/ssl/HostnameVerifier;

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    iput-object p1, p0, Lcom/ning/http/util/DefaultHostnameVerifier;->checker:Lcom/ning/http/util/HostnameChecker;

    .line 77
    iput-object p2, p0, Lcom/ning/http/util/DefaultHostnameVerifier;->extraHostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 78
    return-void
.end method

.method public constructor <init>(Ljavax/net/ssl/HostnameVerifier;)V
    .locals 1
    .param p1, "extraHostnameVerifier"    # Ljavax/net/ssl/HostnameVerifier;

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    new-instance v0, Lcom/ning/http/util/ProxyHostnameChecker;

    invoke-direct {v0}, Lcom/ning/http/util/ProxyHostnameChecker;-><init>()V

    iput-object v0, p0, Lcom/ning/http/util/DefaultHostnameVerifier;->checker:Lcom/ning/http/util/HostnameChecker;

    .line 66
    iput-object p1, p0, Lcom/ning/http/util/DefaultHostnameVerifier;->extraHostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 67
    return-void
.end method

.method private hostnameMatches(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z
    .locals 9
    .param p1, "hostname"    # Ljava/lang/String;
    .param p2, "session"    # Ljavax/net/ssl/SSLSession;

    .prologue
    const/4 v5, 0x0

    .line 88
    sget-object v6, Lcom/ning/http/util/DefaultHostnameVerifier;->log:Lorg/slf4j/Logger;

    const-string v7, "hostname = {}, session = {}"

    invoke-interface {p2}, Ljavax/net/ssl/SSLSession;->getId()[B

    move-result-object v8

    invoke-static {v8}, Lcom/ning/http/util/Base64;->encode([B)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, p1, v8}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 91
    :try_start_0
    invoke-interface {p2}, Ljavax/net/ssl/SSLSession;->getPeerCertificates()[Ljava/security/cert/Certificate;

    move-result-object v3

    .line 92
    .local v3, "peerCertificates":[Ljava/security/cert/Certificate;
    array-length v6, v3

    if-nez v6, :cond_0

    .line 93
    sget-object v6, Lcom/ning/http/util/DefaultHostnameVerifier;->log:Lorg/slf4j/Logger;

    const-string v7, "No peer certificates"

    invoke-interface {v6, v7}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 125
    .end local v3    # "peerCertificates":[Ljava/security/cert/Certificate;
    :goto_0
    return v5

    .line 97
    .restart local v3    # "peerCertificates":[Ljava/security/cert/Certificate;
    :cond_0
    const/4 v6, 0x0

    aget-object v6, v3, v6

    instance-of v6, v6, Ljava/security/cert/X509Certificate;

    if-eqz v6, :cond_1

    .line 98
    const/4 v6, 0x0

    aget-object v2, v3, v6

    check-cast v2, Ljava/security/cert/X509Certificate;

    .line 99
    .local v2, "peerCertificate":Ljava/security/cert/X509Certificate;
    sget-object v6, Lcom/ning/http/util/DefaultHostnameVerifier;->log:Lorg/slf4j/Logger;

    const-string v7, "peerCertificate = {}"

    invoke-interface {v6, v7, v2}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_0 .. :try_end_0} :catch_1

    .line 101
    :try_start_1
    iget-object v6, p0, Lcom/ning/http/util/DefaultHostnameVerifier;->checker:Lcom/ning/http/util/HostnameChecker;

    invoke-interface {v6, p1, v2}, Lcom/ning/http/util/HostnameChecker;->match(Ljava/lang/String;Ljava/security/cert/X509Certificate;)V
    :try_end_1
    .catch Ljava/security/cert/CertificateException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 103
    const/4 v5, 0x1

    goto :goto_0

    .line 104
    :catch_0
    move-exception v0

    .line 105
    .local v0, "ex":Ljava/security/cert/CertificateException;
    :try_start_2
    sget-object v6, Lcom/ning/http/util/DefaultHostnameVerifier;->log:Lorg/slf4j/Logger;

    const-string v7, "Certificate does not match hostname"

    invoke-interface {v6, v7, v0}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 111
    .end local v0    # "ex":Ljava/security/cert/CertificateException;
    .end local v2    # "peerCertificate":Ljava/security/cert/X509Certificate;
    .end local v3    # "peerCertificates":[Ljava/security/cert/Certificate;
    :catch_1
    move-exception v0

    .line 112
    .local v0, "ex":Ljavax/net/ssl/SSLPeerUnverifiedException;
    sget-object v6, Lcom/ning/http/util/DefaultHostnameVerifier;->log:Lorg/slf4j/Logger;

    const-string v7, "Not using certificates for peers, try verifying the principal"

    invoke-interface {v6, v7}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 114
    :try_start_3
    invoke-interface {p2}, Ljavax/net/ssl/SSLSession;->getPeerPrincipal()Ljava/security/Principal;

    move-result-object v4

    .line 115
    .local v4, "peerPrincipal":Ljava/security/Principal;
    sget-object v6, Lcom/ning/http/util/DefaultHostnameVerifier;->log:Lorg/slf4j/Logger;

    const-string v7, "peerPrincipal = {}"

    invoke-interface {v6, v7, v4}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    .line 116
    instance-of v6, v4, Ljavax/security/auth/kerberos/KerberosPrincipal;

    if-eqz v6, :cond_2

    .line 117
    iget-object v6, p0, Lcom/ning/http/util/DefaultHostnameVerifier;->checker:Lcom/ning/http/util/HostnameChecker;

    check-cast v4, Ljavax/security/auth/kerberos/KerberosPrincipal;

    .end local v4    # "peerPrincipal":Ljava/security/Principal;
    invoke-interface {v6, p1, v4}, Lcom/ning/http/util/HostnameChecker;->match(Ljava/lang/String;Ljava/security/Principal;)Z
    :try_end_3
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_3 .. :try_end_3} :catch_2

    move-result v5

    goto :goto_0

    .line 108
    .end local v0    # "ex":Ljavax/net/ssl/SSLPeerUnverifiedException;
    .restart local v3    # "peerCertificates":[Ljava/security/cert/Certificate;
    :cond_1
    :try_start_4
    sget-object v6, Lcom/ning/http/util/DefaultHostnameVerifier;->log:Lorg/slf4j/Logger;

    const-string v7, "Peer does not have any certificates or they aren\'t X.509"

    invoke-interface {v6, v7}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V
    :try_end_4
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_0

    .line 119
    .end local v3    # "peerCertificates":[Ljava/security/cert/Certificate;
    .restart local v0    # "ex":Ljavax/net/ssl/SSLPeerUnverifiedException;
    .restart local v4    # "peerPrincipal":Ljava/security/Principal;
    :cond_2
    :try_start_5
    sget-object v6, Lcom/ning/http/util/DefaultHostnameVerifier;->log:Lorg/slf4j/Logger;

    const-string v7, "Can\'t verify principal, not Kerberos"

    invoke-interface {v6, v7}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V
    :try_end_5
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_0

    .line 121
    .end local v4    # "peerPrincipal":Ljava/security/Principal;
    :catch_2
    move-exception v1

    .line 123
    .local v1, "ex2":Ljavax/net/ssl/SSLPeerUnverifiedException;
    sget-object v6, Lcom/ning/http/util/DefaultHostnameVerifier;->log:Lorg/slf4j/Logger;

    const-string v7, "Can\'t verify principal, no principal"

    invoke-interface {v6, v7, v1}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z
    .locals 2
    .param p1, "hostname"    # Ljava/lang/String;
    .param p2, "session"    # Ljavax/net/ssl/SSLSession;

    .prologue
    const/4 v0, 0x1

    .line 138
    invoke-direct {p0, p1, p2}, Lcom/ning/http/util/DefaultHostnameVerifier;->hostnameMatches(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 141
    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v1, p0, Lcom/ning/http/util/DefaultHostnameVerifier;->extraHostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/ning/http/util/DefaultHostnameVerifier;->extraHostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    invoke-interface {v1, p1, p2}, Ljavax/net/ssl/HostnameVerifier;->verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z

    move-result v1

    if-nez v1, :cond_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method
