.class public Lcom/disneymobile/mocha/NSNotification;
.super Ljava/lang/Object;
.source "NSNotification.java"


# instance fields
.field private final info:Ljava/util/HashMap;
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

.field private final name:Ljava/lang/String;

.field private final object:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;Ljava/util/HashMap;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 19
    .local p3, "info":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/disneymobile/mocha/NSNotification;->name:Ljava/lang/String;

    .line 21
    iput-object p2, p0, Lcom/disneymobile/mocha/NSNotification;->object:Ljava/lang/Object;

    .line 22
    iput-object p3, p0, Lcom/disneymobile/mocha/NSNotification;->info:Ljava/util/HashMap;

    .line 23
    return-void
.end method

.method public static notificationWithNameAndObject(Ljava/lang/String;Ljava/lang/Object;)Lcom/disneymobile/mocha/NSNotification;
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 12
    new-instance v0, Lcom/disneymobile/mocha/NSNotification;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/disneymobile/mocha/NSNotification;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/util/HashMap;)V

    return-object v0
.end method

.method public static notificationWithNameObjectAndUserInfo(Ljava/lang/String;Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disneymobile/mocha/NSNotification;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/disneymobile/mocha/NSNotification;"
        }
    .end annotation

    .prologue
    .line 16
    .local p2, "info":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v0, Lcom/disneymobile/mocha/NSNotification;

    invoke-direct {v0, p0, p1, p2}, Lcom/disneymobile/mocha/NSNotification;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/util/HashMap;)V

    return-object v0
.end method


# virtual methods
.method public name()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/disneymobile/mocha/NSNotification;->name:Ljava/lang/String;

    return-object v0
.end method

.method public object()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/disneymobile/mocha/NSNotification;->object:Ljava/lang/Object;

    return-object v0
.end method

.method public userInfo()Ljava/util/HashMap;
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
    .line 34
    iget-object v0, p0, Lcom/disneymobile/mocha/NSNotification;->info:Ljava/util/HashMap;

    return-object v0
.end method
