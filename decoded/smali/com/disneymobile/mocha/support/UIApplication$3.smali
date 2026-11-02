.class Lcom/disneymobile/mocha/support/UIApplication$3;
.super Ljava/lang/Object;
.source "UIApplication.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disneymobile/mocha/support/UIApplication;->registerForRemoteNotificationTypes(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disneymobile/mocha/support/UIApplication;


# direct methods
.method constructor <init>(Lcom/disneymobile/mocha/support/UIApplication;)V
    .locals 0

    .prologue
    .line 137
    iput-object p1, p0, Lcom/disneymobile/mocha/support/UIApplication$3;->this$0:Lcom/disneymobile/mocha/support/UIApplication;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 141
    return-void
.end method
