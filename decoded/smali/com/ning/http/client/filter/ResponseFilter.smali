.class public interface abstract Lcom/ning/http/client/filter/ResponseFilter;
.super Ljava/lang/Object;
.source "ResponseFilter.java"


# virtual methods
.method public abstract filter(Lcom/ning/http/client/filter/FilterContext;)Lcom/ning/http/client/filter/FilterContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/ning/http/client/filter/FilterContext",
            "<TT;>;)",
            "Lcom/ning/http/client/filter/FilterContext",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/filter/FilterException;
        }
    .end annotation
.end method
