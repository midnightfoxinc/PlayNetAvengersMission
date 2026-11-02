.class public Lcom/disneymobile/mocha/support/UIScreen;
.super Lcom/disneymobile/mocha/NSObject;
.source "UIScreen.java"


# static fields
.field private static mainScreen:Lcom/disneymobile/mocha/support/UIScreen;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSObject;-><init>()V

    return-void
.end method

.method public static mainScreen()Lcom/disneymobile/mocha/support/UIScreen;
    .locals 1

    .prologue
    .line 15
    sget-object v0, Lcom/disneymobile/mocha/support/UIScreen;->mainScreen:Lcom/disneymobile/mocha/support/UIScreen;

    if-nez v0, :cond_0

    .line 16
    new-instance v0, Lcom/disneymobile/mocha/support/UIScreen;

    invoke-direct {v0}, Lcom/disneymobile/mocha/support/UIScreen;-><init>()V

    sput-object v0, Lcom/disneymobile/mocha/support/UIScreen;->mainScreen:Lcom/disneymobile/mocha/support/UIScreen;

    .line 17
    :cond_0
    sget-object v0, Lcom/disneymobile/mocha/support/UIScreen;->mainScreen:Lcom/disneymobile/mocha/support/UIScreen;

    return-object v0
.end method


# virtual methods
.method public applicationFrame()Landroid/graphics/Rect;
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 21
    invoke-static {}, Lcom/disneymobile/mocha/support/Support;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "window"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    .line 22
    .local v0, "windowManager":Landroid/view/WindowManager;
    new-instance v1, Landroid/graphics/Rect;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Display;->getWidth()I

    move-result v2

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Display;->getHeight()I

    move-result v3

    invoke-direct {v1, v4, v4, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v1
.end method
