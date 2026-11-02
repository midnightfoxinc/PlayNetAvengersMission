.class final Lorg/jboss/netty/handler/ssl/util/BouncyCastleSelfSignedCertGenerator;
.super Ljava/lang/Object;
.source "BouncyCastleSelfSignedCertGenerator.java"


# static fields
.field private static final PROVIDER:Ljava/security/Provider;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 42
    new-instance v0, Lorg/bouncycastle/jce/provider/BouncyCastleProvider;

    invoke-direct {v0}, Lorg/bouncycastle/jce/provider/BouncyCastleProvider;-><init>()V

    sput-object v0, Lorg/jboss/netty/handler/ssl/util/BouncyCastleSelfSignedCertGenerator;->PROVIDER:Ljava/security/Provider;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static generate(Ljava/lang/String;Ljava/security/KeyPair;Ljava/security/SecureRandom;)[Ljava/lang/String;
    .locals 11
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

    move-result-object v9

    .line 48
    .local v9, "key":Ljava/security/PrivateKey;
    new-instance v1, Lorg/bouncycastle/asn1/x500/X500Name;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CN="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/bouncycastle/asn1/x500/X500Name;-><init>(Ljava/lang/String;)V

    .line 49
    .local v1, "owner":Lorg/bouncycastle/asn1/x500/X500Name;
    new-instance v0, Lorg/bouncycastle/cert/jcajce/JcaX509v3CertificateBuilder;

    new-instance v2, Ljava/math/BigInteger;

    const/16 v3, 0x40

    invoke-direct {v2, v3, p2}, Ljava/math/BigInteger;-><init>(ILjava/util/Random;)V

    sget-object v3, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->NOT_BEFORE:Ljava/util/Date;

    sget-object v4, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->NOT_AFTER:Ljava/util/Date;

    invoke-virtual {p1}, Ljava/security/KeyPair;->getPublic()Ljava/security/PublicKey;

    move-result-object v6

    move-object v5, v1

    invoke-direct/range {v0 .. v6}, Lorg/bouncycastle/cert/jcajce/JcaX509v3CertificateBuilder;-><init>(Lorg/bouncycastle/asn1/x500/X500Name;Ljava/math/BigInteger;Ljava/util/Date;Ljava/util/Date;Lorg/bouncycastle/asn1/x500/X500Name;Ljava/security/PublicKey;)V

    .line 52
    .local v0, "builder":Lorg/bouncycastle/cert/X509v3CertificateBuilder;
    new-instance v2, Lorg/bouncycastle/operator/jcajce/JcaContentSignerBuilder;

    const-string v3, "SHA256WithRSAEncryption"

    invoke-direct {v2, v3}, Lorg/bouncycastle/operator/jcajce/JcaContentSignerBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v9}, Lorg/bouncycastle/operator/jcajce/JcaContentSignerBuilder;->build(Ljava/security/PrivateKey;)Lorg/bouncycastle/operator/ContentSigner;

    move-result-object v10

    .line 53
    .local v10, "signer":Lorg/bouncycastle/operator/ContentSigner;
    invoke-virtual {v0, v10}, Lorg/bouncycastle/cert/X509v3CertificateBuilder;->build(Lorg/bouncycastle/operator/ContentSigner;)Lorg/bouncycastle/cert/X509CertificateHolder;

    move-result-object v8

    .line 54
    .local v8, "certHolder":Lorg/bouncycastle/cert/X509CertificateHolder;
    new-instance v2, Lorg/bouncycastle/cert/jcajce/JcaX509CertificateConverter;

    invoke-direct {v2}, Lorg/bouncycastle/cert/jcajce/JcaX509CertificateConverter;-><init>()V

    sget-object v3, Lorg/jboss/netty/handler/ssl/util/BouncyCastleSelfSignedCertGenerator;->PROVIDER:Ljava/security/Provider;

    invoke-virtual {v2, v3}, Lorg/bouncycastle/cert/jcajce/JcaX509CertificateConverter;->setProvider(Ljava/security/Provider;)Lorg/bouncycastle/cert/jcajce/JcaX509CertificateConverter;

    move-result-object v2

    invoke-virtual {v2, v8}, Lorg/bouncycastle/cert/jcajce/JcaX509CertificateConverter;->getCertificate(Lorg/bouncycastle/cert/X509CertificateHolder;)Ljava/security/cert/X509Certificate;

    move-result-object v7

    .line 55
    .local v7, "cert":Ljava/security/cert/X509Certificate;
    invoke-virtual {p1}, Ljava/security/KeyPair;->getPublic()Ljava/security/PublicKey;

    move-result-object v2

    invoke-virtual {v7, v2}, Ljava/security/cert/X509Certificate;->verify(Ljava/security/PublicKey;)V

    .line 57
    invoke-static {p0, v9, v7}, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->newSelfSignedCertificate(Ljava/lang/String;Ljava/security/PrivateKey;Ljava/security/cert/X509Certificate;)[Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
