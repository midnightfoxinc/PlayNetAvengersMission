.class interface abstract Lcom/disneymobile/network/DMOHTTPRequest$DMOHTTPRequestDelegate;
.super Ljava/lang/Object;
.source "DMOHTTPRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disneymobile/network/DMOHTTPRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "DMOHTTPRequestDelegate"
.end annotation


# virtual methods
.method public abstract httpRequestChangedCompleteProgress(Lcom/disneymobile/network/DMOHTTPRequest;I)V
.end method

.method public abstract httpRequestDidFailWithError(Lcom/disneymobile/network/DMOHTTPRequest;Lcom/disneymobile/mocha/NSError;)V
.end method

.method public abstract httpRequestDidFinishLoading(Lcom/disneymobile/network/DMOHTTPRequest;)V
.end method
