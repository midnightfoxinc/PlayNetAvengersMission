.class public interface abstract Lcom/ning/http/client/simple/SimpleAHCTransferListener;
.super Ljava/lang/Object;
.source "SimpleAHCTransferListener.java"


# virtual methods
.method public abstract onBytesReceived(Lcom/ning/http/client/uri/Uri;JJJ)V
.end method

.method public abstract onBytesSent(Lcom/ning/http/client/uri/Uri;JJJ)V
.end method

.method public abstract onCompleted(Lcom/ning/http/client/uri/Uri;ILjava/lang/String;)V
.end method

.method public abstract onHeaders(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/simple/HeaderMap;)V
.end method

.method public abstract onStatus(Lcom/ning/http/client/uri/Uri;ILjava/lang/String;)V
.end method
