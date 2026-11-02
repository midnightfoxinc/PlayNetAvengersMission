.class public interface abstract Lcom/ning/http/client/ProgressAsyncHandler;
.super Ljava/lang/Object;
.source "ProgressAsyncHandler.java"

# interfaces
.implements Lcom/ning/http/client/AsyncHandler;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/ning/http/client/AsyncHandler",
        "<TT;>;"
    }
.end annotation


# virtual methods
.method public abstract onContentWriteCompleted()Lcom/ning/http/client/AsyncHandler$STATE;
.end method

.method public abstract onContentWriteProgress(JJJ)Lcom/ning/http/client/AsyncHandler$STATE;
.end method

.method public abstract onHeaderWriteCompleted()Lcom/ning/http/client/AsyncHandler$STATE;
.end method
