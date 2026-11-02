.class public Lcom/disney/emagine/sdk/foreground/EMTApplication;
.super Lcom/disney/emagine/app/EmagineApplication;
.source "EMTApplication.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/disney/emagine/app/EmagineApplication;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 0

    .prologue
    .line 18
    invoke-super {p0}, Lcom/disney/emagine/app/EmagineApplication;->onCreate()V

    .line 19
    invoke-static {p0}, Lcom/disney/emagine/sdk/foreground/Foreground;->init(Landroid/app/Application;)Lcom/disney/emagine/sdk/foreground/Foreground;

    .line 20
    return-void
.end method
