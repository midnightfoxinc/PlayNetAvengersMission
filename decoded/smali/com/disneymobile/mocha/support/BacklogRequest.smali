.class public Lcom/disneymobile/mocha/support/BacklogRequest;
.super Ljava/lang/Object;
.source "BacklogRequest.java"


# instance fields
.field private data:Ljava/lang/Object;

.field private methodName:Ljava/lang/String;

.field private trackingInfo:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getData()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/disneymobile/mocha/support/BacklogRequest;->data:Ljava/lang/Object;

    return-object v0
.end method

.method public getMethodName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 12
    iget-object v0, p0, Lcom/disneymobile/mocha/support/BacklogRequest;->methodName:Ljava/lang/String;

    return-object v0
.end method

.method public getTrackingInfo()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 18
    iget-object v0, p0, Lcom/disneymobile/mocha/support/BacklogRequest;->trackingInfo:Ljava/util/HashMap;

    return-object v0
.end method

.method public setData(Ljava/lang/Object;)V
    .locals 0
    .param p1, "data"    # Ljava/lang/Object;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/disneymobile/mocha/support/BacklogRequest;->data:Ljava/lang/Object;

    .line 28
    return-void
.end method

.method public setMethodName(Ljava/lang/String;)V
    .locals 0
    .param p1, "methodName"    # Ljava/lang/String;

    .prologue
    .line 15
    iput-object p1, p0, Lcom/disneymobile/mocha/support/BacklogRequest;->methodName:Ljava/lang/String;

    .line 16
    return-void
.end method

.method public setTrackingInfo(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 21
    .local p1, "trackingInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iput-object p1, p0, Lcom/disneymobile/mocha/support/BacklogRequest;->trackingInfo:Ljava/util/HashMap;

    .line 22
    return-void
.end method
