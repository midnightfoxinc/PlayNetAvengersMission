.class public interface abstract Lcom/ning/http/client/resumable/ResumableListener;
.super Ljava/lang/Object;
.source "ResumableListener.java"


# virtual methods
.method public abstract length()J
.end method

.method public abstract onAllBytesReceived()V
.end method

.method public abstract onBytesReceived(Ljava/nio/ByteBuffer;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
