.class public Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;
.super Ljava/lang/Object;
.source "ImprovedGuestControllerRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private errorListener:Lcom/disney/id/android/volley/Response$ErrorListener;

.field private headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private listener:Lcom/disney/id/android/volley/Response$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/disney/id/android/volley/Response$Listener",
            "<",
            "Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;",
            ">;"
        }
    .end annotation
.end field

.field private method:Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;

.field private requestBody:Lorg/json/JSONObject;

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;Ljava/lang/String;)V
    .locals 0
    .param p1, "method"    # Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    iput-object p1, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->method:Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;

    .line 74
    iput-object p2, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->url:Ljava/lang/String;

    .line 75
    return-void
.end method

.method static synthetic access$000(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;)Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->method:Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;

    return-object v0
.end method

.method static synthetic access$100(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->url:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;)Lorg/json/JSONObject;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->requestBody:Lorg/json/JSONObject;

    return-object v0
.end method

.method static synthetic access$300(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;)Lcom/disney/id/android/volley/Response$Listener;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->listener:Lcom/disney/id/android/volley/Response$Listener;

    return-object v0
.end method

.method static synthetic access$400(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;)Lcom/disney/id/android/volley/Response$ErrorListener;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->errorListener:Lcom/disney/id/android/volley/Response$ErrorListener;

    return-object v0
.end method

.method static synthetic access$500(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->headers:Ljava/util/Map;

    return-object v0
.end method


# virtual methods
.method public build()Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;
    .locals 2

    .prologue
    .line 98
    new-instance v0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;-><init>(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$1;)V

    return-object v0
.end method

.method public errorListener(Lcom/disney/id/android/volley/Response$ErrorListener;)Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;
    .locals 0
    .param p1, "errorListener"    # Lcom/disney/id/android/volley/Response$ErrorListener;

    .prologue
    .line 93
    iput-object p1, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->errorListener:Lcom/disney/id/android/volley/Response$ErrorListener;

    .line 94
    return-object p0
.end method

.method public headers(Ljava/util/Map;)Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;"
        }
    .end annotation

    .prologue
    .line 83
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->headers:Ljava/util/Map;

    .line 84
    return-object p0
.end method

.method public listener(Lcom/disney/id/android/volley/Response$Listener;)Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disney/id/android/volley/Response$Listener",
            "<",
            "Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;",
            ">;)",
            "Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;"
        }
    .end annotation

    .prologue
    .line 88
    .local p1, "listener":Lcom/disney/id/android/volley/Response$Listener;, "Lcom/disney/id/android/volley/Response$Listener<Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;>;"
    iput-object p1, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->listener:Lcom/disney/id/android/volley/Response$Listener;

    .line 89
    return-object p0
.end method

.method public requestBody(Lorg/json/JSONObject;)Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;
    .locals 0
    .param p1, "requestBody"    # Lorg/json/JSONObject;

    .prologue
    .line 78
    iput-object p1, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->requestBody:Lorg/json/JSONObject;

    .line 79
    return-object p0
.end method
