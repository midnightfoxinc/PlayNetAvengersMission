.class public Lcom/disney/id/android/DIDEntitlements$DIDEntitlement;
.super Ljava/lang/Object;
.source "DIDEntitlements.java"

# interfaces
.implements Lcom/disney/id/android/constants/DIDEntitlementsConst;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/id/android/DIDEntitlements;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DIDEntitlement"
.end annotation


# instance fields
.field private final entitlement:Lorg/json/JSONObject;

.field final synthetic this$0:Lcom/disney/id/android/DIDEntitlements;


# direct methods
.method public constructor <init>(Lcom/disney/id/android/DIDEntitlements;Lorg/json/JSONObject;)V
    .locals 0
    .param p2, "data"    # Lorg/json/JSONObject;

    .prologue
    .line 47
    iput-object p1, p0, Lcom/disney/id/android/DIDEntitlements$DIDEntitlement;->this$0:Lcom/disney/id/android/DIDEntitlements;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p2, p0, Lcom/disney/id/android/DIDEntitlements$DIDEntitlement;->entitlement:Lorg/json/JSONObject;

    .line 49
    return-void
.end method


# virtual methods
.method public getAssetId()Ljava/lang/String;
    .locals 2

    .prologue
    .line 64
    iget-object v0, p0, Lcom/disney/id/android/DIDEntitlements$DIDEntitlement;->entitlement:Lorg/json/JSONObject;

    const-string v1, "assetId"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDigitalAssetName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 55
    iget-object v0, p0, Lcom/disney/id/android/DIDEntitlements$DIDEntitlement;->entitlement:Lorg/json/JSONObject;

    const-string v1, "digitalAssetName"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDigitalAssetSourceName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 58
    iget-object v0, p0, Lcom/disney/id/android/DIDEntitlements$DIDEntitlement;->entitlement:Lorg/json/JSONObject;

    const-string v1, "digitalAssetSourceName"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEffectiveDate()Ljava/lang/String;
    .locals 2

    .prologue
    .line 67
    iget-object v0, p0, Lcom/disney/id/android/DIDEntitlements$DIDEntitlement;->entitlement:Lorg/json/JSONObject;

    const-string v1, "effectiveDate"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExpirationDate()Ljava/lang/String;
    .locals 2

    .prologue
    .line 70
    iget-object v0, p0, Lcom/disney/id/android/DIDEntitlements$DIDEntitlement;->entitlement:Lorg/json/JSONObject;

    const-string v1, "expirationDate"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProductId()Ljava/lang/String;
    .locals 2

    .prologue
    .line 61
    iget-object v0, p0, Lcom/disney/id/android/DIDEntitlements$DIDEntitlement;->entitlement:Lorg/json/JSONObject;

    const-string v1, "productId"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hasAssetId()Z
    .locals 2

    .prologue
    .line 86
    iget-object v0, p0, Lcom/disney/id/android/DIDEntitlements$DIDEntitlement;->entitlement:Lorg/json/JSONObject;

    const-string v1, "assetId"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasDigitalAssetName()Z
    .locals 2

    .prologue
    .line 77
    iget-object v0, p0, Lcom/disney/id/android/DIDEntitlements$DIDEntitlement;->entitlement:Lorg/json/JSONObject;

    const-string v1, "digitalAssetName"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasDigitalAssetSourceName()Z
    .locals 2

    .prologue
    .line 80
    iget-object v0, p0, Lcom/disney/id/android/DIDEntitlements$DIDEntitlement;->entitlement:Lorg/json/JSONObject;

    const-string v1, "digitalAssetSourceName"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasEffectiveDate()Z
    .locals 2

    .prologue
    .line 89
    iget-object v0, p0, Lcom/disney/id/android/DIDEntitlements$DIDEntitlement;->entitlement:Lorg/json/JSONObject;

    const-string v1, "effectiveDate"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasExpirationDate()Z
    .locals 2

    .prologue
    .line 92
    iget-object v0, p0, Lcom/disney/id/android/DIDEntitlements$DIDEntitlement;->entitlement:Lorg/json/JSONObject;

    const-string v1, "expirationDate"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasProductId()Z
    .locals 2

    .prologue
    .line 83
    iget-object v0, p0, Lcom/disney/id/android/DIDEntitlements$DIDEntitlement;->entitlement:Lorg/json/JSONObject;

    const-string v1, "productId"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
