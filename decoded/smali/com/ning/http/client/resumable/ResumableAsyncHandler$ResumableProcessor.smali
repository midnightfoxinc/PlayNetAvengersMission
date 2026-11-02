.class public interface abstract Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;
.super Ljava/lang/Object;
.source "ResumableAsyncHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/resumable/ResumableAsyncHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ResumableProcessor"
.end annotation


# virtual methods
.method public abstract load()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end method

.method public abstract put(Ljava/lang/String;J)V
.end method

.method public abstract remove(Ljava/lang/String;)V
.end method

.method public abstract save(Ljava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation
.end method
