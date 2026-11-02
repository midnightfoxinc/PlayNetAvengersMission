.class public interface abstract Lcom/ning/http/client/ResumableBodyConsumer;
.super Ljava/lang/Object;
.source "ResumableBodyConsumer.java"

# interfaces
.implements Lcom/ning/http/client/BodyConsumer;


# virtual methods
.method public abstract getTransferredBytes()J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract resume()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
