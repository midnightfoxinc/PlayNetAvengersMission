.class public interface abstract Lcom/ning/http/client/BodyConsumer;
.super Ljava/lang/Object;
.source "BodyConsumer.java"

# interfaces
.implements Ljava/io/Closeable;


# virtual methods
.method public abstract consume(Ljava/nio/ByteBuffer;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
