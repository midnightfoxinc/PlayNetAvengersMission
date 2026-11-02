.class public interface abstract Lcom/ning/http/client/multipart/RequestEntity;
.super Ljava/lang/Object;
.source "RequestEntity.java"


# virtual methods
.method public abstract getContentLength()J
.end method

.method public abstract getContentType()Ljava/lang/String;
.end method

.method public abstract writeRequest(Ljava/io/OutputStream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
