.class public interface abstract Lcom/ning/http/client/AsyncHttpProviderConfig;
.super Ljava/lang/Object;
.source "AsyncHttpProviderConfig.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<U:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract addProperty(Ljava/lang/Object;Ljava/lang/Object;)Lcom/ning/http/client/AsyncHttpProviderConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TU;TV;)",
            "Lcom/ning/http/client/AsyncHttpProviderConfig",
            "<TU;TV;>;"
        }
    .end annotation
.end method

.method public abstract getProperty(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TU;)TV;"
        }
    .end annotation
.end method

.method public abstract propertiesSet()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<TU;TV;>;>;"
        }
    .end annotation
.end method

.method public abstract removeProperty(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TU;)TV;"
        }
    .end annotation
.end method
