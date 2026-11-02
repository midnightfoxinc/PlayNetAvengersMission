.class Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory$2;
.super Ljava/lang/Object;
.source "FingerprintTrustManagerFactory.java"

# interfaces
.implements Ljavax/net/ssl/X509TrustManager;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;)V
    .locals 0

    .prologue
    .line 81
    iput-object p1, p0, Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory$2;->this$0:Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private checkTrusted(Ljava/lang/String;[Ljava/security/cert/X509Certificate;)V
    .locals 10
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "chain"    # [Ljava/security/cert/X509Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 92
    const/4 v7, 0x0

    aget-object v2, p2, v7

    .line 93
    .local v2, "cert":Ljava/security/cert/X509Certificate;
    invoke-direct {p0, v2}, Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory$2;->fingerprint(Ljava/security/cert/X509Certificate;)[B

    move-result-object v3

    .line 94
    .local v3, "fingerprint":[B
    const/4 v4, 0x0

    .line 95
    .local v4, "found":Z
    iget-object v7, p0, Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory$2;->this$0:Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;

    invoke-static {v7}, Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;->access$000(Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;)[[B

    move-result-object v1

    .local v1, "arr$":[[B
    array-length v6, v1

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_0
    if-ge v5, v6, :cond_0

    aget-object v0, v1, v5

    .line 96
    .local v0, "allowedFingerprint":[B
    invoke-static {v3, v0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 97
    const/4 v4, 0x1

    .line 102
    .end local v0    # "allowedFingerprint":[B
    :cond_0
    if-nez v4, :cond_2

    .line 103
    new-instance v7, Ljava/security/cert/CertificateException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " certificate with unknown fingerprint: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 95
    .restart local v0    # "allowedFingerprint":[B
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 106
    .end local v0    # "allowedFingerprint":[B
    :cond_2
    return-void
.end method

.method private fingerprint(Ljava/security/cert/X509Certificate;)[B
    .locals 2
    .param p1, "cert"    # Ljava/security/cert/X509Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateEncodingException;
        }
    .end annotation

    .prologue
    .line 109
    invoke-static {}, Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;->access$100()Ljava/lang/ThreadLocal;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/MessageDigest;

    .line 110
    .local v0, "md":Ljava/security/MessageDigest;
    invoke-virtual {v0}, Ljava/security/MessageDigest;->reset()V

    .line 111
    invoke-virtual {p1}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public checkClientTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 1
    .param p1, "chain"    # [Ljava/security/cert/X509Certificate;
    .param p2, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 84
    const-string v0, "client"

    invoke-direct {p0, v0, p1}, Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory$2;->checkTrusted(Ljava/lang/String;[Ljava/security/cert/X509Certificate;)V

    .line 85
    return-void
.end method

.method public checkServerTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 1
    .param p1, "chain"    # [Ljava/security/cert/X509Certificate;
    .param p2, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 88
    const-string v0, "server"

    invoke-direct {p0, v0, p1}, Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory$2;->checkTrusted(Ljava/lang/String;[Ljava/security/cert/X509Certificate;)V

    .line 89
    return-void
.end method

.method public getAcceptedIssuers()[Ljava/security/cert/X509Certificate;
    .locals 1

    .prologue
    .line 115
    sget-object v0, Lorg/jboss/netty/util/internal/EmptyArrays;->EMPTY_X509_CERTIFICATES:[Ljava/security/cert/X509Certificate;

    return-object v0
.end method
