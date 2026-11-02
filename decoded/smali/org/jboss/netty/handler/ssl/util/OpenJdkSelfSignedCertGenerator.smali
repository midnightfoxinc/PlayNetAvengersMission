.class final Lorg/jboss/netty/handler/ssl/util/OpenJdkSelfSignedCertGenerator;
.super Ljava/lang/Object;
.source "OpenJdkSelfSignedCertGenerator.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static generate(Ljava/lang/String;Ljava/security/KeyPair;Ljava/security/SecureRandom;)[Ljava/lang/String;
    .locals 9
    .param p0, "fqdn"    # Ljava/lang/String;
    .param p1, "keypair"    # Ljava/security/KeyPair;
    .param p2, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 45
    invoke-virtual {p1}, Ljava/security/KeyPair;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v3

    .line 48
    .local v3, "key":Ljava/security/PrivateKey;
    new-instance v2, Lsun/security/x509/X509CertInfo;

    invoke-direct {v2}, Lsun/security/x509/X509CertInfo;-><init>()V

    .line 49
    .local v2, "info":Lsun/security/x509/X509CertInfo;
    new-instance v4, Lsun/security/x509/X500Name;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "CN="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lsun/security/x509/X500Name;-><init>(Ljava/lang/String;)V

    .line 50
    .local v4, "owner":Lsun/security/x509/X500Name;
    const-string v5, "version"

    new-instance v6, Lsun/security/x509/CertificateVersion;

    const/4 v7, 0x2

    invoke-direct {v6, v7}, Lsun/security/x509/CertificateVersion;-><init>(I)V

    invoke-virtual {v2, v5, v6}, Lsun/security/x509/X509CertInfo;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 51
    const-string v5, "serialNumber"

    new-instance v6, Lsun/security/x509/CertificateSerialNumber;

    new-instance v7, Ljava/math/BigInteger;

    const/16 v8, 0x40

    invoke-direct {v7, v8, p2}, Ljava/math/BigInteger;-><init>(ILjava/util/Random;)V

    invoke-direct {v6, v7}, Lsun/security/x509/CertificateSerialNumber;-><init>(Ljava/math/BigInteger;)V

    invoke-virtual {v2, v5, v6}, Lsun/security/x509/X509CertInfo;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 53
    :try_start_0
    const-string v5, "subject"

    new-instance v6, Lsun/security/x509/CertificateSubjectName;

    invoke-direct {v6, v4}, Lsun/security/x509/CertificateSubjectName;-><init>(Lsun/security/x509/X500Name;)V

    invoke-virtual {v2, v5, v6}, Lsun/security/x509/X509CertInfo;->set(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    :goto_0
    :try_start_1
    const-string v5, "issuer"

    new-instance v6, Lsun/security/x509/CertificateIssuerName;

    invoke-direct {v6, v4}, Lsun/security/x509/CertificateIssuerName;-><init>(Lsun/security/x509/X500Name;)V

    invoke-virtual {v2, v5, v6}, Lsun/security/x509/X509CertInfo;->set(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/security/cert/CertificateException; {:try_start_1 .. :try_end_1} :catch_1

    .line 62
    :goto_1
    const-string v5, "validity"

    new-instance v6, Lsun/security/x509/CertificateValidity;

    sget-object v7, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->NOT_BEFORE:Ljava/util/Date;

    sget-object v8, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->NOT_AFTER:Ljava/util/Date;

    invoke-direct {v6, v7, v8}, Lsun/security/x509/CertificateValidity;-><init>(Ljava/util/Date;Ljava/util/Date;)V

    invoke-virtual {v2, v5, v6}, Lsun/security/x509/X509CertInfo;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 63
    const-string v5, "key"

    new-instance v6, Lsun/security/x509/CertificateX509Key;

    invoke-virtual {p1}, Ljava/security/KeyPair;->getPublic()Ljava/security/PublicKey;

    move-result-object v7

    invoke-direct {v6, v7}, Lsun/security/x509/CertificateX509Key;-><init>(Ljava/security/PublicKey;)V

    invoke-virtual {v2, v5, v6}, Lsun/security/x509/X509CertInfo;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 64
    const-string v5, "algorithmID"

    new-instance v6, Lsun/security/x509/CertificateAlgorithmId;

    new-instance v7, Lsun/security/x509/AlgorithmId;

    sget-object v8, Lsun/security/x509/AlgorithmId;->sha1WithRSAEncryption_oid:Lsun/security/util/ObjectIdentifier;

    invoke-direct {v7, v8}, Lsun/security/x509/AlgorithmId;-><init>(Lsun/security/util/ObjectIdentifier;)V

    invoke-direct {v6, v7}, Lsun/security/x509/CertificateAlgorithmId;-><init>(Lsun/security/x509/AlgorithmId;)V

    invoke-virtual {v2, v5, v6}, Lsun/security/x509/X509CertInfo;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 68
    new-instance v0, Lsun/security/x509/X509CertImpl;

    invoke-direct {v0, v2}, Lsun/security/x509/X509CertImpl;-><init>(Lsun/security/x509/X509CertInfo;)V

    .line 69
    .local v0, "cert":Lsun/security/x509/X509CertImpl;
    const-string v5, "SHA1withRSA"

    invoke-virtual {v0, v3, v5}, Lsun/security/x509/X509CertImpl;->sign(Ljava/security/PrivateKey;Ljava/lang/String;)V

    .line 72
    const-string v5, "algorithmID.algorithm"

    const-string v6, "x509.algorithm"

    invoke-virtual {v0, v6}, Lsun/security/x509/X509CertImpl;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lsun/security/x509/X509CertInfo;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 73
    new-instance v0, Lsun/security/x509/X509CertImpl;

    .end local v0    # "cert":Lsun/security/x509/X509CertImpl;
    invoke-direct {v0, v2}, Lsun/security/x509/X509CertImpl;-><init>(Lsun/security/x509/X509CertInfo;)V

    .line 74
    .restart local v0    # "cert":Lsun/security/x509/X509CertImpl;
    const-string v5, "SHA1withRSA"

    invoke-virtual {v0, v3, v5}, Lsun/security/x509/X509CertImpl;->sign(Ljava/security/PrivateKey;Ljava/lang/String;)V

    .line 75
    invoke-virtual {p1}, Ljava/security/KeyPair;->getPublic()Ljava/security/PublicKey;

    move-result-object v5

    invoke-virtual {v0, v5}, Lsun/security/x509/X509CertImpl;->verify(Ljava/security/PublicKey;)V

    .line 77
    invoke-static {p0, v3, v0}, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->newSelfSignedCertificate(Ljava/lang/String;Ljava/security/PrivateKey;Ljava/security/cert/X509Certificate;)[Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 54
    .end local v0    # "cert":Lsun/security/x509/X509CertImpl;
    :catch_0
    move-exception v1

    .line 55
    .local v1, "ignore":Ljava/security/cert/CertificateException;
    const-string v5, "subject"

    invoke-virtual {v2, v5, v4}, Lsun/security/x509/X509CertInfo;->set(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 59
    .end local v1    # "ignore":Ljava/security/cert/CertificateException;
    :catch_1
    move-exception v1

    .line 60
    .restart local v1    # "ignore":Ljava/security/cert/CertificateException;
    const-string v5, "issuer"

    invoke-virtual {v2, v5, v4}, Lsun/security/x509/X509CertInfo;->set(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1
.end method
