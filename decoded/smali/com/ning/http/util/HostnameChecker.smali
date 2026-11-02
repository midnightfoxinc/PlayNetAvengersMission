.class public interface abstract Lcom/ning/http/util/HostnameChecker;
.super Ljava/lang/Object;
.source "HostnameChecker.java"


# virtual methods
.method public abstract match(Ljava/lang/String;Ljava/security/cert/X509Certificate;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation
.end method

.method public abstract match(Ljava/lang/String;Ljava/security/Principal;)Z
.end method
