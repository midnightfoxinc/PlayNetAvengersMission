.class final Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$1;
.super Ljava/lang/Object;
.source "HostnameVerifierListener.java"

# interfaces
.implements Lorg/glassfish/grizzly/CompletionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener;->wrapWithHostnameVerifierHandler(Lorg/glassfish/grizzly/CompletionHandler;Ljavax/net/ssl/HostnameVerifier;Ljava/lang/String;)Lorg/glassfish/grizzly/CompletionHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/glassfish/grizzly/CompletionHandler",
        "<",
        "Lorg/glassfish/grizzly/Connection;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$completionHandler:Lorg/glassfish/grizzly/CompletionHandler;

.field final synthetic val$host:Ljava/lang/String;

.field final synthetic val$verifier:Ljavax/net/ssl/HostnameVerifier;


# direct methods
.method constructor <init>(Lorg/glassfish/grizzly/CompletionHandler;Ljavax/net/ssl/HostnameVerifier;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 64
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$1;->val$completionHandler:Lorg/glassfish/grizzly/CompletionHandler;

    iput-object p2, p0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$1;->val$verifier:Ljavax/net/ssl/HostnameVerifier;

    iput-object p3, p0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$1;->val$host:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cancelled()V
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$1;->val$completionHandler:Lorg/glassfish/grizzly/CompletionHandler;

    if-eqz v0, :cond_0

    .line 68
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$1;->val$completionHandler:Lorg/glassfish/grizzly/CompletionHandler;

    invoke-interface {v0}, Lorg/glassfish/grizzly/CompletionHandler;->cancelled()V

    .line 70
    :cond_0
    return-void
.end method

.method public bridge synthetic completed(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 64
    check-cast p1, Lorg/glassfish/grizzly/Connection;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$1;->completed(Lorg/glassfish/grizzly/Connection;)V

    return-void
.end method

.method public completed(Lorg/glassfish/grizzly/Connection;)V
    .locals 3
    .param p1, "connection"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$1;->val$verifier:Ljavax/net/ssl/HostnameVerifier;

    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$1;->val$host:Ljava/lang/String;

    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$1;->val$completionHandler:Lorg/glassfish/grizzly/CompletionHandler;

    invoke-static {p1, v0, v1, v2}, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener;->access$000(Lorg/glassfish/grizzly/Connection;Ljavax/net/ssl/HostnameVerifier;Ljava/lang/String;Lorg/glassfish/grizzly/CompletionHandler;)V

    .line 82
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$1;->val$completionHandler:Lorg/glassfish/grizzly/CompletionHandler;

    if-eqz v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$1;->val$completionHandler:Lorg/glassfish/grizzly/CompletionHandler;

    invoke-interface {v0, p1}, Lorg/glassfish/grizzly/CompletionHandler;->completed(Ljava/lang/Object;)V

    .line 85
    :cond_0
    return-void
.end method

.method public failed(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 73
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$1;->val$completionHandler:Lorg/glassfish/grizzly/CompletionHandler;

    if-eqz v0, :cond_0

    .line 74
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$1;->val$completionHandler:Lorg/glassfish/grizzly/CompletionHandler;

    invoke-interface {v0, p1}, Lorg/glassfish/grizzly/CompletionHandler;->failed(Ljava/lang/Throwable;)V

    .line 76
    :cond_0
    return-void
.end method

.method public bridge synthetic updated(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 64
    check-cast p1, Lorg/glassfish/grizzly/Connection;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$1;->updated(Lorg/glassfish/grizzly/Connection;)V

    return-void
.end method

.method public updated(Lorg/glassfish/grizzly/Connection;)V
    .locals 1
    .param p1, "connection"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$1;->val$completionHandler:Lorg/glassfish/grizzly/CompletionHandler;

    if-eqz v0, :cond_0

    .line 89
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$1;->val$completionHandler:Lorg/glassfish/grizzly/CompletionHandler;

    invoke-interface {v0, p1}, Lorg/glassfish/grizzly/CompletionHandler;->updated(Ljava/lang/Object;)V

    .line 91
    :cond_0
    return-void
.end method
