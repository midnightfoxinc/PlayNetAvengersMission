.class public interface abstract Lcom/ning/http/client/SSLEngineFactory;
.super Ljava/lang/Object;
.source "SSLEngineFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/SSLEngineFactory$DefaultSSLEngineFactory;
    }
.end annotation


# virtual methods
.method public abstract newSSLEngine(Ljava/lang/String;I)Ljavax/net/ssl/SSLEngine;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation
.end method
