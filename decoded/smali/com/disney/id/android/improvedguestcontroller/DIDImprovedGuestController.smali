.class public Lcom/disney/id/android/improvedguestcontroller/DIDImprovedGuestController;
.super Ljava/lang/Object;
.source "DIDImprovedGuestController.java"

# interfaces
.implements Lcom/disney/id/android/improvedguestcontroller/IGuestController;


# instance fields
.field private mRequestQueue:Lcom/disney/id/android/volley/RequestQueue;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Lcom/disney/id/android/volley/DIDNetwork;

    new-instance v1, Lcom/disney/id/android/volley/toolbox/HurlStack;

    invoke-direct {v1}, Lcom/disney/id/android/volley/toolbox/HurlStack;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/disney/id/android/volley/DIDNetwork;-><init>(Lcom/disney/id/android/volley/toolbox/HttpStack;Landroid/content/Context;)V

    .line 23
    .local v0, "network":Lcom/disney/id/android/volley/Network;
    new-instance v1, Lcom/disney/id/android/volley/RequestQueue;

    new-instance v2, Lcom/disney/id/android/volley/toolbox/NoCache;

    invoke-direct {v2}, Lcom/disney/id/android/volley/toolbox/NoCache;-><init>()V

    invoke-direct {v1, v2, v0}, Lcom/disney/id/android/volley/RequestQueue;-><init>(Lcom/disney/id/android/volley/Cache;Lcom/disney/id/android/volley/Network;)V

    iput-object v1, p0, Lcom/disney/id/android/improvedguestcontroller/DIDImprovedGuestController;->mRequestQueue:Lcom/disney/id/android/volley/RequestQueue;

    .line 25
    iget-object v1, p0, Lcom/disney/id/android/improvedguestcontroller/DIDImprovedGuestController;->mRequestQueue:Lcom/disney/id/android/volley/RequestQueue;

    invoke-virtual {v1}, Lcom/disney/id/android/volley/RequestQueue;->start()V

    .line 26
    return-void
.end method


# virtual methods
.method public cancelAll(Ljava/lang/Object;)V
    .locals 1
    .param p1, "tag"    # Ljava/lang/Object;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/disney/id/android/improvedguestcontroller/DIDImprovedGuestController;->mRequestQueue:Lcom/disney/id/android/volley/RequestQueue;

    invoke-virtual {v0, p1}, Lcom/disney/id/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    .line 36
    return-void
.end method

.method public handleRequest(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;)V
    .locals 1
    .param p1, "request"    # Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/disney/id/android/improvedguestcontroller/DIDImprovedGuestController;->mRequestQueue:Lcom/disney/id/android/volley/RequestQueue;

    invoke-virtual {v0, p1}, Lcom/disney/id/android/volley/RequestQueue;->add(Lcom/disney/id/android/volley/Request;)Lcom/disney/id/android/volley/Request;

    .line 31
    return-void
.end method
