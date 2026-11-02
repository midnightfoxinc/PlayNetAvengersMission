.class public Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;
.super Landroid/support/v4/app/FragmentActivity;
.source "DIDSocialRegistrationActivity.java"

# interfaces
.implements Lcom/disney/id/android/DIDReachability$DIDReachabilityListener;


# static fields
.field static final REQUEST_EXTRA_NAME:Ljava/lang/String; = "com.disney.id.android.REQUEST"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private context:Landroid/content/Context;

.field private mDIDExternal:Lcom/disney/id/android/external/DIDExternal;

.field private mDIDExternalData:Lcom/disney/id/android/external/DIDExternalData;

.field private final mDIDReachability:Lcom/disney/id/android/DIDReachability;

.field private mLocalDataHandler:Lcom/disney/id/android/localdata/DIDLocalDataHandler;

.field private mRequest:Lcom/disney/id/android/DIDRequest;

.field private progressTracking:Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 57
    const-class v0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 56
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    .line 63
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;

    invoke-direct {v0, p0}, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;-><init>(Landroid/support/v4/app/FragmentActivity;)V

    iput-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->progressTracking:Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;

    .line 72
    new-instance v0, Lcom/disney/id/android/DIDReachability;

    invoke-direct {v0}, Lcom/disney/id/android/DIDReachability;-><init>()V

    iput-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDReachability:Lcom/disney/id/android/DIDReachability;

    return-void
.end method

.method static synthetic access$002(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;Lcom/disney/id/android/external/DIDExternalData;)Lcom/disney/id/android/external/DIDExternalData;
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;
    .param p1, "x1"    # Lcom/disney/id/android/external/DIDExternalData;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternalData:Lcom/disney/id/android/external/DIDExternalData;

    return-object p1
.end method

.method static synthetic access$100(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    .prologue
    .line 56
    invoke-direct {p0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->loginSocial()V

    return-void
.end method

.method static synthetic access$200(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;)Lcom/disney/id/android/DIDRequest;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    return-object v0
.end method

.method static synthetic access$300(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;Lcom/disney/id/android/DIDResponse;)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;
    .param p1, "x1"    # Lcom/disney/id/android/DIDResponse;

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->finishWithResult(Lcom/disney/id/android/DIDResponse;)V

    return-void
.end method

.method static synthetic access$400(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;)Lcom/disney/id/android/localdata/DIDLocalDataHandler;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mLocalDataHandler:Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    return-object v0
.end method

.method static synthetic access$500(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;Lorg/json/JSONObject;)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;
    .param p1, "x1"    # Lorg/json/JSONObject;

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->updateGuestMarketing(Lorg/json/JSONObject;)V

    return-void
.end method

.method static synthetic access$600(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$700(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;Lorg/json/JSONObject;ILjava/util/Map;)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;
    .param p1, "x1"    # Lorg/json/JSONObject;
    .param p2, "x2"    # I
    .param p3, "x3"    # Ljava/util/Map;

    .prologue
    .line 56
    invoke-direct {p0, p1, p2, p3}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->handleSocialLoginError(Lorg/json/JSONObject;ILjava/util/Map;)V

    return-void
.end method

.method private configureLayout()V
    .locals 5

    .prologue
    .line 109
    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->isStatusBarHidden()Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 110
    sget v2, Lcom/disney/id/android/R$style;->DisneyIDTheme_NoStatusBar:I

    invoke-virtual {p0, v2}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->setTheme(I)V

    .line 112
    :cond_0
    sget v2, Lcom/disney/id/android/R$layout;->did_activity_layout:I

    invoke-virtual {p0, v2}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->setContentView(I)V

    .line 114
    sget v2, Lcom/disney/id/android/R$id;->did_background:I

    invoke-virtual {p0, v2}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 117
    .local v1, "imageView":Landroid/widget/ImageView;
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {p0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/disney/id/android/R$drawable;->did_background:I

    invoke-static {v3, v4}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 119
    .local v0, "background":Landroid/graphics/drawable/BitmapDrawable;
    sget-object v2, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/BitmapDrawable;->setTileModeX(Landroid/graphics/Shader$TileMode;)V

    .line 120
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x10

    if-lt v2, v3, :cond_1

    .line 121
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 126
    :goto_0
    return-void

    .line 124
    :cond_1
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method private finishWithResult(Lcom/disney/id/android/DIDResponse;)V
    .locals 2
    .param p1, "response"    # Lcom/disney/id/android/DIDResponse;

    .prologue
    .line 176
    invoke-static {}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->getInstance()Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->getCachedLightBoxInteraction()Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->prepareToDisplayNextPage()V

    .line 177
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDSessionManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/disney/id/android/DIDSessionManager;->sendResponse(Lcom/disney/id/android/DIDResponse;)V

    .line 178
    invoke-virtual {p1}, Lcom/disney/id/android/DIDResponse;->getResponseCode()I

    move-result v0

    invoke-virtual {p0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->setResult(ILandroid/content/Intent;)V

    .line 179
    invoke-virtual {p0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->finish()V

    .line 180
    return-void
.end method

.method private handleSocialLoginError(Lorg/json/JSONObject;ILjava/util/Map;)V
    .locals 9
    .param p1, "response"    # Lorg/json/JSONObject;
    .param p2, "status"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "I",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 332
    .local p3, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v6, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->progressTracking:Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;

    invoke-virtual {v6}, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;->stopProgress()V

    .line 334
    const-string v6, "PRELOAD_INFO"

    const-string v7, "handleSocialLoginError called()"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 335
    iget-object v6, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->context:Landroid/content/Context;

    invoke-static {v6}, Lcom/disney/id/android/DIDUtils;->isContextAlive(Landroid/content/Context;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 393
    :goto_0
    return-void

    .line 337
    :cond_0
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 339
    .local v4, "requestData":Lorg/json/JSONObject;
    :try_start_0
    const-string v6, "response"

    invoke-virtual {v4, v6, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 340
    const-string v6, "status"

    invoke-virtual {v4, v6, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 341
    if-eqz p3, :cond_1

    .line 342
    const-string v6, "headers"

    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7, p3}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 344
    :cond_1
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 345
    .local v5, "userProfile":Lorg/json/JSONObject;
    iget-object v6, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v6}, Lcom/disney/id/android/DIDRequest;->getRequestData()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 346
    new-instance v2, Lorg/json/JSONObject;

    iget-object v6, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v6}, Lcom/disney/id/android/DIDRequest;->getRequestData()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 347
    .local v2, "oldRequestData":Lorg/json/JSONObject;
    const-string v6, "legalAssertions"

    invoke-static {v2, v6}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 348
    const-string v6, "legalAssertions"

    const-string v7, "legalAssertions"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 350
    :cond_2
    const-string v6, "marketing"

    invoke-static {v2, v6}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 351
    const-string v6, "marketing"

    const-string v7, "marketing"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 354
    .end local v2    # "oldRequestData":Lorg/json/JSONObject;
    :cond_3
    const-string v6, "profile"

    iget-object v7, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternalData:Lcom/disney/id/android/external/DIDExternalData;

    invoke-virtual {v7}, Lcom/disney/id/android/external/DIDExternalData;->getProfileJSON()Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 355
    const-string v6, "userProfile"

    invoke-virtual {v4, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 356
    const-string v6, "namespace"

    iget-object v7, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternalData:Lcom/disney/id/android/external/DIDExternalData;

    invoke-virtual {v7}, Lcom/disney/id/android/external/DIDExternalData;->getNamespace()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 360
    const-string v6, "externalToken"

    iget-object v7, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternalData:Lcom/disney/id/android/external/DIDExternalData;

    invoke-virtual {v7}, Lcom/disney/id/android/external/DIDExternalData;->getExternalToken()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 361
    const-string v6, "externalId"

    iget-object v7, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternalData:Lcom/disney/id/android/external/DIDExternalData;

    invoke-virtual {v7}, Lcom/disney/id/android/external/DIDExternalData;->getExternalId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 362
    const-string v6, "externalDisplayName"

    iget-object v7, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternalData:Lcom/disney/id/android/external/DIDExternalData;

    invoke-virtual {v7}, Lcom/disney/id/android/external/DIDExternalData;->getEmail()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 364
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 365
    .local v1, "namespaceElement":Lorg/json/JSONObject;
    const-string v6, "externalId"

    iget-object v7, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternalData:Lcom/disney/id/android/external/DIDExternalData;

    invoke-virtual {v7}, Lcom/disney/id/android/external/DIDExternalData;->getExternalId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 366
    const-string v6, "externalDisplayName"

    iget-object v7, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternalData:Lcom/disney/id/android/external/DIDExternalData;

    invoke-virtual {v7}, Lcom/disney/id/android/external/DIDExternalData;->getDisplayName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 367
    const-string v6, "externalToken"

    iget-object v7, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternalData:Lcom/disney/id/android/external/DIDExternalData;

    invoke-virtual {v7}, Lcom/disney/id/android/external/DIDExternalData;->getExternalToken()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 368
    iget-object v6, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternalData:Lcom/disney/id/android/external/DIDExternalData;

    invoke-virtual {v6}, Lcom/disney/id/android/external/DIDExternalData;->getNamespace()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 370
    new-instance v3, Lorg/json/JSONObject;

    iget-object v6, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v6}, Lcom/disney/id/android/DIDRequest;->getRequestData()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 371
    .local v3, "optional":Lorg/json/JSONObject;
    const-string v6, "optionalConfigs"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 372
    const-string v6, "optionalConfigs"

    const-string v7, "optionalConfigs"

    invoke-virtual {v3, v7}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 377
    :goto_1
    sget-object v6, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "requestData: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 383
    .end local v1    # "namespaceElement":Lorg/json/JSONObject;
    .end local v3    # "optional":Lorg/json/JSONObject;
    .end local v5    # "userProfile":Lorg/json/JSONObject;
    :goto_2
    iget-object v6, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/disney/id/android/DIDRequest;->setRequestData(Ljava/lang/String;)V

    .line 385
    new-instance v6, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$3;

    invoke-direct {v6, p0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$3;-><init>(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;)V

    invoke-virtual {p0, v6}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 374
    .restart local v1    # "namespaceElement":Lorg/json/JSONObject;
    .restart local v3    # "optional":Lorg/json/JSONObject;
    .restart local v5    # "userProfile":Lorg/json/JSONObject;
    :cond_4
    :try_start_1
    sget-object v6, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "PANIC: optionalConfigs missing: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 379
    .end local v1    # "namespaceElement":Lorg/json/JSONObject;
    .end local v3    # "optional":Lorg/json/JSONObject;
    .end local v5    # "userProfile":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 380
    .local v0, "ignore":Lorg/json/JSONException;
    sget-object v6, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unexpected exception "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method private initExternalLogin()V
    .locals 3

    .prologue
    .line 129
    sget-object v0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "initExternalLogin()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    const-string v0, "PRELOAD_INFO"

    const-string v1, "DIDSocialRegistrationActivity.initExternalLogin() called"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    new-instance v0, Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    iget-object v1, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mLocalDataHandler:Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    .line 134
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternal:Lcom/disney/id/android/external/DIDExternal;

    if-nez v0, :cond_2

    .line 136
    invoke-static {}, Lcom/disney/id/android/external/DIDExternalFactory;->instance()Lcom/disney/id/android/external/DIDExternalFactory;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v1}, Lcom/disney/id/android/DIDRequest;->getRequestCode()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/disney/id/android/external/DIDExternalFactory;->createExternal(I)Lcom/disney/id/android/external/DIDExternal;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternal:Lcom/disney/id/android/external/DIDExternal;

    .line 137
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternal:Lcom/disney/id/android/external/DIDExternal;

    if-nez v0, :cond_1

    .line 138
    new-instance v0, Lcom/disney/id/android/DIDResponse;

    const/4 v1, -0x1

    iget-object v2, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-direct {v0, v1, v2}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;)V

    invoke-direct {p0, v0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->finishWithResult(Lcom/disney/id/android/DIDResponse;)V

    .line 173
    :cond_0
    :goto_0
    return-void

    .line 141
    :cond_1
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternal:Lcom/disney/id/android/external/DIDExternal;

    iget-object v1, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->context:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/external/DIDExternal;->setContext(Landroid/content/Context;)V

    .line 142
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternal:Lcom/disney/id/android/external/DIDExternal;

    invoke-virtual {v0}, Lcom/disney/id/android/external/DIDExternal;->check()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 145
    :cond_2
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternal:Lcom/disney/id/android/external/DIDExternal;

    invoke-virtual {v0}, Lcom/disney/id/android/external/DIDExternal;->onResume()V

    .line 147
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->progressTracking:Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;->startProgress()V

    .line 150
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternal:Lcom/disney/id/android/external/DIDExternal;

    new-instance v1, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$1;

    invoke-direct {v1, p0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$1;-><init>(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;)V

    invoke-virtual {v0, v1}, Lcom/disney/id/android/external/DIDExternal;->setCallback(Lcom/disney/id/android/external/DIDExternalCallback;)V

    .line 172
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternal:Lcom/disney/id/android/external/DIDExternal;

    invoke-virtual {v0}, Lcom/disney/id/android/external/DIDExternal;->getExternalData()V

    goto :goto_0
.end method

.method private loginSocial()V
    .locals 8

    .prologue
    .line 183
    iget-object v5, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternalData:Lcom/disney/id/android/external/DIDExternalData;

    if-nez v5, :cond_0

    .line 184
    new-instance v5, Lcom/disney/id/android/DIDResponse;

    const/4 v6, -0x1

    iget-object v7, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-direct {v5, v6, v7}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;)V

    invoke-direct {p0, v5}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->finishWithResult(Lcom/disney/id/android/DIDResponse;)V

    .line 324
    :goto_0
    return-void

    .line 188
    :cond_0
    iget-object v5, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->progressTracking:Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;

    invoke-virtual {v5}, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;->startProgress()V

    .line 190
    iget-object v5, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/disney/id/android/DIDStateManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDStateManager;

    move-result-object v4

    .line 191
    .local v4, "stateManager":Lcom/disney/id/android/DIDStateManager;
    invoke-virtual {v4}, Lcom/disney/id/android/DIDStateManager;->getCurrentSessionIds()Ljava/util/Map;

    move-result-object v1

    .line 192
    .local v1, "stateHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v4}, Lcom/disney/id/android/DIDStateManager;->markServiceCallStart()V

    .line 193
    const-string v0, "event:login:social:namespace"

    .line 194
    .local v0, "actionName":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 196
    .local v2, "serviceCallStartTime":J
    iget-object v5, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->context:Landroid/content/Context;

    iget-object v6, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternalData:Lcom/disney/id/android/external/DIDExternalData;

    invoke-virtual {v6}, Lcom/disney/id/android/external/DIDExternalData;->getLoginInput()Lorg/json/JSONObject;

    move-result-object v6

    new-instance v7, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;

    invoke-direct {v7, p0, v4, v2, v3}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;-><init>(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;Lcom/disney/id/android/DIDStateManager;J)V

    invoke-static {v5, v1, v6, v7}, Lcom/disney/id/android/guestcontroller/GuestController;->loginSocial(Landroid/content/Context;Ljava/util/Map;Lorg/json/JSONObject;Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V

    goto :goto_0
.end method

.method private updateGuestMarketing(Lorg/json/JSONObject;)V
    .locals 7
    .param p1, "guest"    # Lorg/json/JSONObject;

    .prologue
    .line 399
    iget-object v5, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->progressTracking:Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;

    invoke-virtual {v5}, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;->startProgress()V

    .line 401
    iget-object v5, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/disney/id/android/DIDStateManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDStateManager;

    move-result-object v4

    .line 402
    .local v4, "stateManager":Lcom/disney/id/android/DIDStateManager;
    invoke-virtual {v4}, Lcom/disney/id/android/DIDStateManager;->markServiceCallStart()V

    .line 403
    const-string v0, "event:update:guest:marketing"

    .line 404
    .local v0, "actionName":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 405
    .local v2, "serviceCallStartTime":J
    invoke-virtual {v4}, Lcom/disney/id/android/DIDStateManager;->getCurrentSessionIds()Ljava/util/Map;

    move-result-object v1

    .line 408
    .local v1, "stateHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v5, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->context:Landroid/content/Context;

    new-instance v6, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$4;

    invoke-direct {v6, p0, v4, v2, v3}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$4;-><init>(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;Lcom/disney/id/android/DIDStateManager;J)V

    invoke-static {v5, v1, p1, v6}, Lcom/disney/id/android/guestcontroller/GuestController;->updateGuest(Landroid/content/Context;Ljava/util/Map;Lorg/json/JSONObject;Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V

    .line 457
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    .line 462
    const-string v0, "PRELOAD_INFO"

    const-string v1, "Calling DIDSocialRegistrationActivity.onActivityResult()"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 463
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/FragmentActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 465
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDRequest;->getRequestCode()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 486
    new-instance v0, Lcom/disney/id/android/DIDResponse;

    iget-object v1, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-direct {v0, p2, v1}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;)V

    invoke-direct {p0, v0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->finishWithResult(Lcom/disney/id/android/DIDResponse;)V

    .line 489
    :cond_0
    :goto_0
    return-void

    .line 467
    :pswitch_0
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternal:Lcom/disney/id/android/external/DIDExternal;

    if-eqz v0, :cond_1

    .line 468
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternal:Lcom/disney/id/android/external/DIDExternal;

    invoke-virtual {v0, p1, p2, p3}, Lcom/disney/id/android/external/DIDExternal;->onActivityResult(IILandroid/content/Intent;)V

    .line 470
    :cond_1
    if-nez p2, :cond_0

    .line 472
    new-instance v0, Lcom/disney/id/android/DIDResponse;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-direct {v0, v1, v2}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;)V

    invoke-direct {p0, v0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->finishWithResult(Lcom/disney/id/android/DIDResponse;)V

    goto :goto_0

    .line 476
    :pswitch_1
    const/16 v0, 0x2328

    if-ne p1, v0, :cond_2

    const/4 v0, -0x1

    if-ne p2, v0, :cond_2

    .line 478
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternal:Lcom/disney/id/android/external/DIDExternal;

    if-eqz v0, :cond_0

    .line 479
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternal:Lcom/disney/id/android/external/DIDExternal;

    invoke-virtual {v0, p1, p2, p3}, Lcom/disney/id/android/external/DIDExternal;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0

    .line 482
    :cond_2
    new-instance v0, Lcom/disney/id/android/DIDResponse;

    iget-object v1, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-direct {v0, p2, v1}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;)V

    invoke-direct {p0, v0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->finishWithResult(Lcom/disney/id/android/DIDResponse;)V

    goto :goto_0

    .line 465
    nop

    :pswitch_data_0
    .packed-switch 0x300
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 91
    const-string v0, "PRELOAD_INFO"

    const-string v1, "DIDSocialRegistrationActivity.onCreate() called"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 94
    iput-object p0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->context:Landroid/content/Context;

    .line 96
    invoke-virtual {p0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "com.disney.id.android.REQUEST"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/disney/id/android/DIDRequest;

    iput-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    .line 98
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;

    invoke-direct {v0, p0}, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;-><init>(Landroid/support/v4/app/FragmentActivity;)V

    iput-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->progressTracking:Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;

    .line 100
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDReachability:Lcom/disney/id/android/DIDReachability;

    iget-object v1, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->context:Landroid/content/Context;

    invoke-virtual {v0, v1, p0}, Lcom/disney/id/android/DIDReachability;->registerContext(Landroid/content/Context;Lcom/disney/id/android/DIDReachability$DIDReachabilityListener;)V

    .line 102
    invoke-direct {p0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->configureLayout()V

    .line 104
    invoke-direct {p0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->initExternalLogin()V

    .line 105
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 524
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onDestroy()V

    .line 525
    sget-object v0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "onDestroy()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 526
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternal:Lcom/disney/id/android/external/DIDExternal;

    if-eqz v0, :cond_0

    .line 527
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternal:Lcom/disney/id/android/external/DIDExternal;

    invoke-virtual {v0}, Lcom/disney/id/android/external/DIDExternal;->onDestroy()V

    .line 528
    :cond_0
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDReachability:Lcom/disney/id/android/DIDReachability;

    iget-object v1, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->context:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDReachability;->unregisterContext(Landroid/content/Context;)V

    .line 529
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 533
    const/4 v1, 0x4

    if-ne p1, v1, :cond_0

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v1

    if-nez v1, :cond_0

    .line 534
    invoke-static {}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->getInstance()Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->getCachedLightBoxInteraction()Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    move-result-object v0

    .line 535
    .local v0, "lightBoxInteraction":Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;
    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->prepareToDisplayNextPage()V

    .line 538
    .end local v0    # "lightBoxInteraction":Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/FragmentActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    return v1
.end method

.method public onNetworkReachabilityChange(Z)V
    .locals 4
    .param p1, "connected"    # Z

    .prologue
    const/4 v3, 0x7

    .line 76
    if-nez p1, :cond_0

    iget-object v1, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/disney/id/android/DIDUtils;->isContextAlive(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->progressTracking:Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;

    invoke-virtual {v1}, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;->isProgressShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 79
    sget-object v1, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->TAG:Ljava/lang/String;

    invoke-static {v1}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "No network connection available."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    new-instance v0, Lcom/disney/id/android/DIDResponse;

    iget-object v1, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    new-instance v2, Lcom/disney/id/android/DIDException;

    invoke-direct {v2, v3}, Lcom/disney/id/android/DIDException;-><init>(I)V

    invoke-direct {v0, v3, v1, v2}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;Lcom/disney/id/android/DIDException;)V

    .line 83
    .local v0, "response":Lcom/disney/id/android/DIDResponse;
    invoke-direct {p0, v0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->finishWithResult(Lcom/disney/id/android/DIDResponse;)V

    .line 87
    .end local v0    # "response":Lcom/disney/id/android/DIDResponse;
    :goto_0
    return-void

    .line 85
    :cond_0
    const-string v1, "PRELOAD_INFO"

    const-string v2, "DIDSocialRegistrationActivity reports that everything\'s fine on the connection front"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected onPause()V
    .locals 2

    .prologue
    .line 508
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onPause()V

    .line 509
    sget-object v0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "onPause()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 510
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternal:Lcom/disney/id/android/external/DIDExternal;

    if-eqz v0, :cond_0

    .line 511
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternal:Lcom/disney/id/android/external/DIDExternal;

    invoke-virtual {v0}, Lcom/disney/id/android/external/DIDExternal;->onPause()V

    .line 512
    :cond_0
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 493
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 494
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternal:Lcom/disney/id/android/external/DIDExternal;

    if-eqz v0, :cond_0

    .line 495
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternal:Lcom/disney/id/android/external/DIDExternal;

    invoke-virtual {v0, p1}, Lcom/disney/id/android/external/DIDExternal;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 496
    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 2

    .prologue
    .line 500
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onStart()V

    .line 501
    sget-object v0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "onStart()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 502
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternal:Lcom/disney/id/android/external/DIDExternal;

    if-eqz v0, :cond_0

    .line 503
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternal:Lcom/disney/id/android/external/DIDExternal;

    invoke-virtual {v0}, Lcom/disney/id/android/external/DIDExternal;->onStart()V

    .line 504
    :cond_0
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 516
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onStop()V

    .line 517
    sget-object v0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "onStop()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 518
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternal:Lcom/disney/id/android/external/DIDExternal;

    if-eqz v0, :cond_0

    .line 519
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->mDIDExternal:Lcom/disney/id/android/external/DIDExternal;

    invoke-virtual {v0}, Lcom/disney/id/android/external/DIDExternal;->onStop()V

    .line 520
    :cond_0
    return-void
.end method
