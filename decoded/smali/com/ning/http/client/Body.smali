.class public interface abstract Lcom/ning/http/client/Body;
.super Ljava/lang/Object;
.source "Body.java"

# interfaces
.implements Ljava/io/Closeable;


# virtual methods
.method public abstract getContentLength()J
.end method

.method public abstract read(Ljava/nio/ByteBuffer;)J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
