.class public interface abstract Lcom/ning/http/client/listener/TransferListener;
.super Ljava/lang/Object;
.source "TransferListener.java"


# virtual methods
.method public abstract onBytesReceived([B)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract onBytesSent(JJJ)V
.end method

.method public abstract onRequestHeadersSent(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)V
.end method

.method public abstract onRequestResponseCompleted()V
.end method

.method public abstract onResponseHeadersReceived(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)V
.end method

.method public abstract onThrowable(Ljava/lang/Throwable;)V
.end method
